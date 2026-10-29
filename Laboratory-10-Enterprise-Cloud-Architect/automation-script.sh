#!/usr/bin/env bash
# CloudNova automation: backup, restore, health check (with self-healing)
# Usage: ./automation-script.sh {backup|health|restore <file.sql.gz>|all}
set -uo pipefail

PROJECT_DIR="${PROJECT_DIR:-$HOME/cloudnova-stack}"
BACKUP_DIR="${BACKUP_DIR:-$HOME/cloudnova-backups}"
LOG_FILE="$BACKUP_DIR/automation.log"
RETENTION_DAYS=7
DB_CONTAINER="cloudnova-db"
WEB_CONTAINER="cloudnova-web"
WP_VOLUME="cloudnova-stack_wp_data"
WEB_URL="http://localhost:8080"
STAMP="$(date +%Y%m%d_%H%M%S)"

mkdir -p "$BACKUP_DIR"
cd "$PROJECT_DIR" || { echo "Project dir not found: $PROJECT_DIR"; exit 1; }

log() { echo "[$(date '+%F %T')] $*" | tee -a "$LOG_FILE"; }

backup() {
  log "BACKUP started"
  # Database dump (password read from inside the container, never on the command line)
  if docker exec "$DB_CONTAINER" sh -c 'mariadb-dump -uroot -p"$MARIADB_ROOT_PASSWORD" --all-databases --single-transaction' \
      | gzip > "$BACKUP_DIR/db_$STAMP.sql.gz" && [ -s "$BACKUP_DIR/db_$STAMP.sql.gz" ]; then
    log "DB backup OK: db_$STAMP.sql.gz"
  else
    log "ERROR: DB backup failed"; rm -f "$BACKUP_DIR/db_$STAMP.sql.gz"; return 1
  fi
  # WordPress files (uploads, themes, plugins) from the named volume
  if docker run --rm -v "$WP_VOLUME":/data:ro -v "$BACKUP_DIR":/backup --entrypoint tar wordpress:latest \
      czf "/backup/wp_$STAMP.tar.gz" -C /data . ; then
    log "Files backup OK: wp_$STAMP.tar.gz"
  else
    log "ERROR: Files backup failed"; return 1
  fi
  # Retention: delete backups older than N days
  find "$BACKUP_DIR" -name 'db_*.sql.gz' -mtime +"$RETENTION_DAYS" -delete
  find "$BACKUP_DIR" -name 'wp_*.tar.gz' -mtime +"$RETENTION_DAYS" -delete
  log "BACKUP finished (retention: $RETENTION_DAYS days)"
}

health() {
  log "HEALTH check started"
  local healed=0
  for c in "$DB_CONTAINER" "$WEB_CONTAINER"; do
    state="$(docker inspect -f '{{.State.Status}}' "$c" 2>/dev/null || echo missing)"
    if [ "$state" != "running" ]; then
      log "WARN: $c is $state -> restarting stack"
      docker compose up -d >> "$LOG_FILE" 2>&1; healed=1
    fi
  done
  dbh="$(docker inspect -f '{{.State.Health.Status}}' "$DB_CONTAINER" 2>/dev/null || echo unknown)"
  if [ "$dbh" != "healthy" ]; then
    log "WARN: DB health is '$dbh' -> restarting DB"
    docker restart "$DB_CONTAINER" >> "$LOG_FILE" 2>&1; healed=1; sleep 20
  fi
  code="$(curl -s -o /dev/null -w '%{http_code}' --max-time 10 "$WEB_URL" || echo 000)"
  if [[ "$code" =~ ^(200|301|302)$ ]]; then
    log "Web OK (HTTP $code)"
  else
    log "WARN: Web returned HTTP $code -> restarting web"
    docker restart "$WEB_CONTAINER" >> "$LOG_FILE" 2>&1; healed=1
  fi
  [ "$healed" -eq 1 ] && log "HEALTH: self-healing actions were taken" || log "HEALTH: all services healthy"
}

restore() {
  local file="${1:-}"
  [ -f "$file" ] || { echo "Usage: $0 restore <path/to/db_xxx.sql.gz>"; exit 1; }
  read -rp "This overwrites the current database. Type YES to continue: " ans
  [ "$ans" = "YES" ] || { echo "Cancelled."; exit 0; }
  log "RESTORE from $file"
  gunzip -c "$file" | docker exec -i "$DB_CONTAINER" sh -c 'mariadb -uroot -p"$MARIADB_ROOT_PASSWORD"' \
    && log "RESTORE OK" || log "ERROR: restore failed"
}

case "${1:-}" in
  backup)  backup ;;
  health)  health ;;
  restore) restore "${2:-}" ;;
  all)     health; backup ;;
  *) echo "Usage: $0 {backup|health|restore <file.sql.gz>|all}"; exit 1 ;;
esac

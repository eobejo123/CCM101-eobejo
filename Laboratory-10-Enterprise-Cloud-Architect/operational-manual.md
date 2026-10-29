# Operational Manual: CloudNova Private Cloud

## 1. System summary
| Item | Value |
|---|---|
| VM hostname | `cloudnova-server` |
| VM user | `ranny` |
| VM IP (NAT) | 10.0.2.15 |
| Project folder | `~/cloudnova-stack` |
| Backup folder | `~/cloudnova-backups` |
| Web URL (from host) | `http://localhost:8080` |
| SSH (from host) | `ssh -p 2222 ranny@127.0.0.1` |

## 2. Initial setup
### 2.1 Install Docker Engine and Compose
```bash
sudo apt update && sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER
sudo systemctl enable docker
```
Log out and back in, then verify: `docker --version`, `docker compose version`.

### 2.2 Credentials
```bash
cd ~/cloudnova-stack
cp .env.example .env
nano .env          # set strong, different passwords
chmod 600 .env
echo ".env" >> .gitignore
```

### 2.3 Deploy
```bash
docker compose config
docker compose up -d
docker compose ps
```
Complete the WordPress installer at `http://localhost:8080` (use a non-default admin username).

## 3. Security
### 3.1 Firewall (UFW)
Allow SSH **before** enabling, or you will lock yourself out.
```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 8080/tcp
sudo ufw enable
sudo ufw status verbose
```

### 3.2 Notes on Docker and UFW
Docker publishes ports by editing iptables directly, so a published port can bypass UFW rules. This stack limits that risk by publishing only one port (8080) and giving the database no published port at all.

### 3.3 SSH hardening (optional)
- Use key-based login (`ssh-keygen -t ed25519`, then copy the public key to `~/.ssh/authorized_keys`).
- After confirming key login works, set `PasswordAuthentication no` in `/etc/ssh/sshd_config` and run `sudo systemctl restart ssh`.

### 3.4 Other controls
- `.env` has permission 600 and is excluded from Git.
- DB runs on an internal `backend` network only.
- Apply updates regularly: `sudo apt update && sudo apt upgrade -y`.

## 4. Automation
`automation-script.sh` supports:
| Command | Action |
|---|---|
| `./automation-script.sh backup` | DB dump (`db_*.sql.gz`) and WordPress files (`wp_*.tar.gz`); 7-day retention |
| `./automation-script.sh health` | Checks containers, DB health, HTTP status; restarts failed parts |
| `./automation-script.sh restore <file>` | Restores the DB from a dump after confirmation |
| `./automation-script.sh all` | Health check, then backup |

Logs: `~/cloudnova-backups/automation.log`

### 4.1 Scheduling (cron)
`crontab -e`, then add:
```
*/5 * * * * /home/ranny/cloudnova-stack/automation-script.sh health
0 2 * * * /home/ranny/cloudnova-stack/automation-script.sh backup
```
Verify with `crontab -l`.

## 5. Testing procedures
### 5.1 Persistence
1. Create a test post in WordPress.
2. `docker compose down && docker compose up -d` → post still exists.
3. `sudo reboot` → after boot, `docker compose ps` shows both containers up and the post still exists.

### 5.2 Self-healing
```bash
docker stop cloudnova-web
./automation-script.sh health
docker compose ps
```
Expected: the log shows a warning and the web container is running again.

### 5.3 Disaster recovery
1. `./automation-script.sh backup`
2. Delete the test post (or change content) in WordPress.
3. `./automation-script.sh restore ~/cloudnova-backups/db_<timestamp>.sql.gz` and type `YES`.
4. Refresh the site; the content is back.

## 6. Troubleshooting
| Symptom | Check / fix |
|---|---|
| Site unreachable from host | `docker compose ps`; confirm VirtualBox rule host 8080 → guest 8080; `sudo ufw status` |
| DB connection error on first start | Wait 30–60 s; `docker compose logs db` |
| `permission denied` on docker | Log out and back in after `usermod -aG docker` |
| SSH refused | `sudo systemctl status ssh`; confirm rule host 2222 → guest 22 |
| Windows console looks frozen | Title bar says "Select"; press `Esc` |
| Script errors with `\r` | `sed -i 's/\r$//' automation-script.sh` |
| `-v` deleted my data | `docker compose down -v` removes volumes; never use it in production |

## 7. Useful commands
```bash
docker compose ps
docker compose logs -f
docker compose restart
docker volume ls
docker volume inspect cloudnova-stack_db_data
```


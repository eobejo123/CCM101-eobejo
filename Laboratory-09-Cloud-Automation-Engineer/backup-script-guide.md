# Backup Script Guide

## The Script (backup.sh)
```bash
#!/bin/bash
# Automated Backup Script for CloudNova Technologies

SOURCE_DIR="app-data"
BACKUP_DIR="backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

echo "Initiating automated backup..."

# Create the backup directory if it does not exist
mkdir -p $BACKUP_DIR

# Compress the source directory into a tarball (.tar.gz)
tar -czf $BACKUP_DIR/backup_$TIMESTAMP.tar.gz $SOURCE_DIR

echo "Backup completed successfully at $TIMESTAMP!"
```

## What `chmod +x backup.sh` Did
By default, Linux treats a new text file as data, not as a program, even
if it contains valid shell commands — this prevents the system from
accidentally executing random text files. `chmod +x backup.sh` grants the
file **execute permission**, explicitly telling Linux that this file is
allowed to be run as a program. Without this step, attempting to run
`./backup.sh` fails with a "Permission denied" error.

## Cron Expression Breakdown: `0 2 * * * /root/backup.sh`
| Field | Value | Meaning |
|---|---|---|
| Minute | `0` | At minute 0 |
| Hour | `2` | At 2 AM (02:00, 24-hour time) |
| Day of Month | `*` | Every day of the month |
| Month | `*` | Every month |
| Day of Week | `*` | Every day of the week |

Put together, this schedules `/root/backup.sh` to run automatically every
single night at exactly **2:00 AM**, with no human intervention required.

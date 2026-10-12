# Laboratory Activity 9: Mission 9 – The Cloud Automation Engineer

## Mission Overview
This lab eliminates human error from a recurring operational task by
writing a Bash script that automatically compresses and backs up a
client's application data, then scheduling that script to run every night
at 2:00 AM using the Linux cron scheduler — with no one needing to press a
button.

## Objectives
- Understand the fundamental syntax of a Bash shell script, including variables and basic commands
- Use the nano text editor to write and save an executable script
- Modify Linux file permissions using chmod
- Understand task scheduling and the syntax of a Linux crontab
- Document automation code and cron job configuration using Markdown

## Commands Executed
- `mkdir app-data` / `echo "..." > app-data/data.txt` — created dummy client data
- `nano backup.sh` — wrote the automated backup script
- `chmod +x backup.sh` — granted execute permission to the script
- `./backup.sh` — ran the script, producing a compressed `.tar.gz` backup
- `crontab -e` — added a cron entry: `0 2 * * * /root/backup.sh`
- `crontab -l` — verified the installed schedule

## Skills Learned
- Writing and executing a Bash shell script from the terminal
- Managing Linux file permissions with chmod
- Scheduling recurring automated tasks with cron
- Documenting automation code and scheduling syntax for other engineers

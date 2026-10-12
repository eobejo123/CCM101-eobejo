# Automation Research

## Bash Script
A Bash script is a plain text file containing a sequence of Linux commands
that the shell executes in order, from top to bottom, exactly as if a
person had typed them one by one. The `#!/bin/bash` line at the very top
of the file is called a "shebang" — it tells the operating system exactly
which interpreter (in this case, Bash) should be used to read and run the
rest of the file.

## Variables
Programmers use variables like `$BACKUP_DIR` instead of retyping the exact
folder path every time because it makes scripts easier to maintain and far
less error-prone. If the backup location ever changes, only the single
variable assignment at the top of the script needs to be updated, rather
than hunting down and editing every command in the file that references
that path.

## Cron Job
A cron job is a scheduled task registered with Linux's built-in `cron`
daemon, which executes a specified script or command automatically at a
set time, date, or interval with no human interaction required. It's
essential for cloud operations because critical routine tasks — like
backups — can't depend on a person remembering to run them manually every
single day; cron removes that human element entirely.

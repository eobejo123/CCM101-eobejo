# Firewall Configuration

## Allow SSH
sudo ufw allow ssh

## Default Deny Policy
sudo ufw default deny incoming
sudo ufw default allow outgoing

## Allow Port 8080 (Web Application)
sudo ufw allow 8080/tcp

## What happens if `ufw enable` runs before `ufw allow ssh`?
Running `sudo ufw enable` before allowing SSH would immediately block all
incoming traffic, including the active SSH connection, locking the
administrator out of the server with no way back in except through the
cloud provider's emergency console.

## Verification: sudo ufw status verbose
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing), deny (routed)
New profiles: skip

To                         Action      From
--                         ------      ----
22/tcp                     ALLOW IN    Anywhere
22/tcp (v6)                ALLOW IN    Anywhere (v6)

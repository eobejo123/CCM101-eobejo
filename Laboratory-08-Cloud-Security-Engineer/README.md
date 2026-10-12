# Laboratory Activity 8: Mission 8 – The Cloud Security Engineer

## Mission Overview
This lab applies defense-in-depth by locking down a live server with a
host-based firewall — deploying an exposed web application, auditing open
ports, and configuring UFW with a Default Deny policy that blocks all
traffic except the specific services the application actually needs.

## Objectives
- Understand the Attack Surface and the Principle of Least Privilege
- Perform a basic security audit of active network ports
- Configure UFW with a Default Deny policy
- Implement granular port management for SSH and HTTP traffic

## Commands Executed
- `docker run -d --name secure-web-app -p 8080:80 nginx` — deployed the exposed web app
- `sudo ufw allow ssh` — allowed SSH before enabling the firewall
- `sudo ufw default deny incoming` / `sudo ufw default allow outgoing` — set the Default Deny policy
- `sudo ufw enable` — activated the firewall
- `sudo ufw status verbose` — confirmed the active rules
- `sudo ufw allow 8080/tcp` — opened the port the web app needs
- `sudo ufw status numbered` — verified the new rule

## Skills Learned
- Configuring a host-based firewall with a Default Deny policy
- Understanding why rule order matters (SSH before enabling the firewall)
- Granular port management to minimize a server's attack surface
- Documenting security configurations clearly for other engineers

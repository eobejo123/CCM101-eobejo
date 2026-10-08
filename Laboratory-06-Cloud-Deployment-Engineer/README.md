# Laboratory Activity 6: Mission 6 – The Cloud Deployment Engineer

## Mission Overview
This lab introduces Infrastructure as Code (IaC) using Docker Compose,
deploying a two-tier private cloud storage application (Nextcloud +
MariaDB) with a single YAML configuration file instead of manual,
one-by-one container commands.

## Objectives
- Explain the concept of multi-tier application architecture
- Understand the purpose and structure of a docker-compose.yml file
- Use nano to create configuration files on the command line
- Deploy a multi-container application using Docker Compose
- Document deployment procedures and IaC principles in Markdown

## Commands Executed
- `mkdir nextcloud-deployment`, `cd nextcloud-deployment`
- `nano docker-compose.yml`
- `docker-compose up -d`
- `docker-compose ps`
- `docker-compose down`

## Skills Learned
- Writing a valid, properly indented YAML configuration file
- Deploying multiple linked containers with a single command
- Understanding how Docker Compose's internal networking and DNS
  resolution let containers find each other by service name
- Documenting Infrastructure as Code for other engineers

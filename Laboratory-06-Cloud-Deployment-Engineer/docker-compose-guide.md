# Docker Compose Guide — Nextcloud + MariaDB

## What does the `services:` block do?
It defines every container that makes up the application stack. Each
entry under `services:` (here, `database` and `app`) becomes its own
container, with its own image, environment variables, and settings —
Docker Compose reads this block and builds/starts all of them together.

## How did the Nextcloud app container find the database container?
Through the `MYSQL_HOST=database` environment variable. Docker Compose
automatically creates a private network for all services in the file
and registers each service's name (`database`) as a DNS hostname other
containers on that network can resolve — so the `app` container can
reach the database simply by connecting to the hostname `database`,
no IP address needed.

## Difference between `docker run` and `docker-compose up -d`
`docker run` starts one container at a time, with all of its
configuration typed out as command-line flags each time. `docker-compose
up -d` reads a single YAML file and starts every service it defines —
networking, environment variables, and all — with one command, which is
far less error-prone for multi-container applications.

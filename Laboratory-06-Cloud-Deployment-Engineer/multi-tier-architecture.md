# Multi-Tier Architecture: Two-Tier Deployment

## The Web/Application Tier
This tier (the Nextcloud `app` container) is what the end user actually
interacts with. It serves the web interface, handles incoming HTTP
requests on port 8080, and processes file uploads, logins, and sharing
actions before passing anything that needs to be stored to the database
tier.

## The Database Tier
This tier (the `database` container running MariaDB) is responsible for
persistent data — user accounts, login credentials, file metadata, and
sharing permissions. It doesn't serve anything to the public internet
directly; it only responds to requests from the application tier.

## Why Separate Them?
Separating the web and database into two containers means each one can
be scaled, restarted, updated, or secured independently — if the
Nextcloud app needs an update, the database container doesn't need to
go down, and vice versa. It also limits the attack surface: the
database is never directly exposed to the internet, only reachable
through the internal Docker network the application tier uses.

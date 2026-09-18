# Docker Deployment Log

## Commands Used to Deploy Nginx

- `docker pull nginx` – downloaded the official Nginx image from Docker Hub.
- `docker run -d -p 8080:80 nginx` – created and started an Nginx container in the background, mapping host port `8080` to container port `80`.
- `curl http://localhost:8080` – verified that the Nginx web server was running and returning the default Nginx HTML page.

## Nginx Deployment Verification

The Nginx container was successfully deployed in the KillerCoda environment. The browser displayed the **"Welcome to nginx!"** page, confirming that the web server was working.

The `curl http://localhost:8080` command also returned the Nginx HTML response, providing additional confirmation that the container was serving web content.

## Container Lifecycle Commands

- `docker ps` – listed the currently running Nginx container and displayed its container ID.
- `docker stop 2f9f4e1ab7c0` – stopped the running Nginx container.
- `docker ps -a` – listed all containers and confirmed that the Nginx container had an `Exited (0)` status.
- `docker rm 2f9f4e1ab7c0` – removed the stopped Nginx container from the system.

## Container Information

- **Container ID:** `2f9f4e1ab7c0`
- **Image:** `nginx`
- **Port Mapping:** `8080:80`
- **Status Before Removal:** `Exited (0)`
- **Final Status:** Container removed successfully

## Screenshots

### Nginx Successfully Deployed

The first screenshot shows the Nginx container running and the browser displaying the default **Welcome to nginx!** page.

### Container Stopped and Removed

The second screenshot shows the container lifecycle commands. The container was stopped, verified using `docker ps -a`, and then removed using `docker rm`.

The **502 Bad Gateway** shown in the browser occurred after the Nginx container was no longer available.

## Summary

This activity demonstrated the basic Docker container lifecycle. I successfully pulled the Nginx image, deployed the container, verified that the web server was working, stopped the container, checked its status, and removed it from the Docker environment.

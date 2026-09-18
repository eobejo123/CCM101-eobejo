# Laboratory Activity 4: Mission 4 – The Cloud-Native Engineer

## Mission Overview

In this activity, I explored the shift from traditional virtualization to containerization, researched the architectural differences between VMs and containers, and deployed a live, containerized Nginx web server using Docker inside a KillerCoda environment.

## Objectives

- Differentiate between traditional Virtual Machines (VMs) and Containers
- Access a Docker-enabled cloud environment using KillerCoda
- Execute fundamental Docker CLI commands
- Pull, run, manage, and terminate a containerized application (Nginx)
- Create professional technical documentation using Markdown
- Continue developing a well-organized GitHub Cloud Computing Portfolio

## Docker Commands Executed

- `docker version` – checked the installed Docker version
- `docker info` – checked the current status of the Docker environment
- `docker pull nginx` – downloaded the official Nginx image from Docker Hub
- `docker run -d -p 8080:80 nginx` – created and started the Nginx container in the background, mapping host port 8080 to container port 80
- `curl http://localhost:8080` – verified that the Nginx web server was serving requests successfully
- `docker ps` – listed the running Nginx container and displayed its container ID
- `docker stop 2f9f4e1ab7c0` – stopped the running Nginx container
- `docker ps -a` – verified that the container status changed to `Exited (0)`
- `docker rm 2f9f4e1ab7c0` – removed the stopped Nginx container

## Nginx Deployment Verification

The Nginx web server was successfully deployed using Docker. After running the container, I accessed the KillerCoda port in a web browser and received the default **"Welcome to nginx!"** page.

I also used `curl http://localhost:8080` in the terminal. The command returned the Nginx HTML page, confirming that the web server was running and responding to requests.

## Container Information

- **Container ID:** `2f9f4e1ab7c0`
- **Image:** `nginx`
- **Port Mapping:** `8080:80`
- **Initial Status:** Running
- **Final Container Status:** `Exited (0)`
- **Final Action:** Container removed successfully

## Skills Learned

- Understanding the architectural difference between VMs and containers
- Verifying a Docker environment's installation and status
- Pulling images from Docker Hub and running containers
- Mapping host ports to container ports
- Using `curl` to test a web server
- Checking running and stopped containers
- Managing the full Docker container lifecycle
- Documenting technical activities using Markdown

## Challenges Encountered

One challenge I encountered was understanding how to properly use the container ID when stopping and removing a Docker container. I learned that the actual container ID must be used instead of the `<container_id>` placeholder.

Another challenge was understanding port mapping. The `-p 8080:80` option connects port `8080` on the host to port `80` inside the Nginx container. This allowed me to access the Nginx web server through the KillerCoda environment.

I also encountered a **502 Bad Gateway** page in the browser after stopping and removing the container. This happened because the Nginx container was no longer running, so the browser could no longer connect to the web server.


### Nginx Successfully Running

The first screenshot shows the Nginx container running successfully. The browser displays the **"Welcome to nginx!"** page, while the terminal shows the successful `docker pull`, `docker run`, and `curl` commands.

### Container Stopped and Removed

The second screenshot shows the container being checked with `docker ps` and `docker ps -a`. The container reached an `Exited (0)` status before being removed using `docker rm`.

The browser shows **502 Bad Gateway** because the Nginx container had already been stopped and removed.

## Summary

This activity helped me understand how containerization works using Docker. I successfully pulled the Nginx image, deployed and tested the container, managed its lifecycle, and removed it after completing the activity.

## Technologies Used

- Docker
- Nginx
- Ubuntu 24.04
- KillerCoda
- Docker Hub
- GitHub

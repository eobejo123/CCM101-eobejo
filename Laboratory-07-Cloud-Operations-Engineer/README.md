# Laboratory Activity 7: Mission 7 – The Cloud Operations Engineer

## Mission Overview
This activity centers on observability — measuring a host server's
baseline condition, standing up a containerized Nginx web server,
triggering both successful and failed requests against it, and relying on
Docker's built-in logging and metrics features to confirm the setup can
handle a surge in traffic.

## Objectives
- Apply native Linux command-line tools to check host CPU, memory, and disk usage
- Launch a web container and observe its performance in real time
- Generate traffic and pull the resulting access logs for review
- Turn raw monitoring data into a clear, written technical report

## Monitoring Commands Executed
- `free -h` — reviewed available memory
- `df -h` — reviewed available disk space
- `top` — watched live CPU usage and running processes
- `docker run -d --name client-website -p 8080:80 nginx` — launched the container
- `curl http://localhost:8080` — sent normal traffic to the server
- `curl http://localhost:8080/hidden-admin-page` — triggered a 404 error on purpose
- `docker logs client-website` — pulled the container's access logs
- `docker stats` — checked the container's live CPU and memory consumption

## Skills Learned
- Measuring a server's baseline performance before putting it to use
- Producing and interpreting HTTP access logs, including error responses
- Reading a container's live resource consumption (CPU, memory, network I/O)
- Distinguishing between what logs reveal versus what metrics reveal

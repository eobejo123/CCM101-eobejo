# Reflection

### 1. How does the boot time and setup process of a Docker container compare to installing an operating system on a Virtual Machine?

Docker containers are much quicker to start compared to Virtual Machines. A VM needs to boot a complete operating system before the application can run, which can take several minutes. Docker containers share the host system's kernel, so they can start in just a few seconds. In this activity, I was able to run Nginx and access the web server shortly after using the `docker run` command.

### 2. Why is port mapping (-p 8080:80) necessary when running a web server inside a container?

Port mapping is needed because Nginx runs on port 80 inside the container, while the container has its own isolated network. The `-p 8080:80` option connects port 8080 of the host to port 80 of the container. This allowed me to access the Nginx server through `localhost:8080`. Without port mapping, the Nginx server would still be running, but it would not be directly accessible from the host.

### 3. What happens to the data inside a container when you use the docker rm command?

When `docker rm` is used, the container and the data stored in its writable filesystem are deleted. This means important data should not be stored only inside the container. For data that needs to remain available after deleting a container, Docker volumes or other external storage should be used.

### 4. How do you think containerization changes the way software developers and IT operations teams work together (DevOps)?

Containerization makes it easier for developers and IT operations teams to work together. It helps reduce problems caused by differences between development and production environments. Since the application and its dependencies can be packaged together in a container, the same setup can be used for testing and deployment. Containers are also useful for automated CI/CD workflows.

### 5. How is your GitHub portfolio evolving?

My GitHub portfolio is becoming more organized and focused on practical cloud computing skills. The previous labs covered Linux basics, infrastructure investigation, and cloud platform comparisons. In Lab 4, I added hands-on experience with Docker and Nginx deployment. Each activity is helping me build a portfolio that shows my progress and experience with different cloud technologies.

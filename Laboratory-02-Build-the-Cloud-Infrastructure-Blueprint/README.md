# Laboratory Activity 2: Mission 2 – Build the Cloud Infrastructure Blueprint

## Mission Overview
In this lab, I explored a live Linux server hosted in the cloud, broke down
the core building blocks that make up cloud infrastructure, compared how
the top three cloud providers handle those same building blocks, and put
together a basic architecture diagram showing how it all connects.

## Objectives
- Break down the major components that make up cloud infrastructure
- Explore the hardware and software available inside a Linux environment
- Tell apart compute, storage, networking, and identity resources
- Understand how these infrastructure components depend on one another
- Produce clean technical documentation using Markdown
- Keep growing a structured, professional GitHub Cloud Computing Portfolio

## Cloud Infrastructure Components
- **Compute:** the processing power behind everything — VMs, containers, serverless functions
- **Storage:** where data actually lives — object, block, and file storage
- **Networking:** the connections tying it all together — virtual networks, firewalls, load balancers
- **Identity and Access Management (IAM):** decides who's allowed to do what

## Tools Used
- KillerCoda Playground (cloud-based Ubuntu environment)
- GitHub (for the portfolio repository)
- Draw.io (for the architecture diagram)
- AWS, Microsoft Azure, and Google Cloud Platform official documentation

## Linux Commands Executed
- `cat /etc/os-release` – identify the OS version
- `uname -r` – identify the kernel version
- `lscpu | grep "Model name"` – identify the CPU model
- `nproc` – count available CPU cores
- `free -h` – check total and available memory
- `df -h` – check disk space and mounted file systems
- `hostname` / `hostname -I` – identify the machine's hostname and IP address

## Skills Learned
- Reading and interpreting Linux system specs directly from the CLI
- Understanding how cloud infrastructure components relate to each other
- Comparing equivalent services across AWS, Azure, and GCP
- Building a basic cloud architecture diagram from scratch
- Writing clear, professional documentation in Markdown

## Challenges Encountered
One thing that took extra attention was making sure the right Linux
command was used for the right piece of information — some outputs (like
`df -h` and `free -h`) look similar at a glance but report completely
different things, so double-checking each result against what the
checkpoint actually asked for was important. Cross-referencing service
names across three different cloud providers for the comparison table also
took a bit of research, since AWS, Azure, and GCP each use their own
branding for what are functionally the same services.

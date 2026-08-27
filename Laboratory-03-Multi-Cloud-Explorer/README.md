## Checkpoint 7: Linux Investigation

Using the KillerCoda Playground, the following commands were run to gather system information:

```bash
uname -a
lscpu
free -h
df -h
```

### System Findings

- **Operating System:** Ubuntu Linux, kernel version 6.8.0-138-generic, 64-bit (x86_64)
- **CPU:** 1 vCPU — Intel Xeon E312xx (Sandy Bridge), running at 2.0 GHz, virtualized under a KVM hypervisor
- **Memory:** 1.9 GiB total RAM (422 MiB used, 846 MiB free, 1.4 GiB available), plus 1.0 GiB of swap
- **Disk Space:** 19 GB root filesystem (`/dev/vda1`), 5.4 GB used, 13 GB available (30% used)

This is a lightweight, single-core virtual machine with limited RAM and modest disk space — typical of a small test/training environment rather than a production server.

### If this Linux server were migrated to the cloud, which AWS, Azure, and GCP services could host it?

Given the server's modest specs (1 vCPU, ~2 GB RAM, ~19 GB disk), it would map to the smallest general-purpose or burstable virtual machine tiers on each platform:

- **AWS** – Amazon EC2 using a burstable instance type such as **t3.small** (2 vCPU, 2 GiB RAM) or **t3.micro**, with **Amazon EBS** providing the root volume storage. The t-series is ideal here since the server is lightweight and doesn't need sustained high CPU performance.
- **Azure** – **Azure Virtual Machines** using a B-series burstable size such as **B1s** or **B2s** (matching low vCPU/RAM needs), with an **Azure Managed Disk** for the OS/root volume. The B-series is Azure's equivalent low-cost, low-usage VM tier.
- **GCP** – **Google Compute Engine** using an **e2-small** or **e2-medium** machine type, with a **Persistent Disk** for storage. GCP's e2 series is built specifically for cost-efficient, general-purpose workloads like this one.

All three options would preserve the existing Ubuntu 6.8 kernel environment through a custom machine image or snapshot, allowing this server to be lifted directly into the cloud with minimal reconfiguration.

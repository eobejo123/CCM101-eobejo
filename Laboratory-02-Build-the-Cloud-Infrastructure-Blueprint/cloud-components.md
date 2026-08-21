# Cloud Infrastructure Components

## Compute Resources
Compute is essentially the "engine" of the cloud — it's the actual
processing power that lets applications run, calculations happen, and
operating systems function at all. In practice this shows up as virtual
machines, containers, or serverless functions, depending on what a
workload needs.

What makes this critical in cloud computing is elasticity: instead of
buying a physical server and being stuck with whatever specs it has,
organizations can scale compute up or down instantly based on demand. In
my own KillerCoda environment, the playground itself IS a compute
resource — a virtual machine with 1 CPU core running an Intel Xeon
E312xx processor, provisioned for me on demand without any physical
hardware purchase on my end.

## Storage Resources
Storage is where all the actual data lives — the OS files, application
data, user uploads, backups, everything. Cloud environments typically
split this into object storage (like files/backups), block storage (like
VM disks), and file storage (shared folders).

Storage matters in cloud computing because data has to be durable and
accessible no matter what — a single failed hard drive shouldn't mean
lost data, which is why cloud storage is distributed across multiple
physical systems behind the scenes. Running `df -h` on my KillerCoda
machine showed a 19G disk with about 13G available on the root
filesystem — that's the block storage volume attached to my virtual
machine, functioning the same way a cloud VM's disk would in a real
deployment.

## Networking Resources
Networking is the connective tissue between everything else — it's what
allows a compute resource to actually reach storage, other services, or
end users at all. This includes virtual networks, firewalls, routers, and
load balancers.

Without solid networking, cloud infrastructure would just be a collection
of isolated, unreachable pieces. Good network design is also a security
layer — it controls what can talk to what, and what's exposed to the
public internet versus kept internal. My playground's own hostname
(`ubuntu`) and IP addresses (`172.30.1.2` / `172.17.0.1`, from
`hostname -I`) are how it's networked within KillerCoda's infrastructure,
letting me reach it remotely through my browser.

## Operating System
The operating system is the layer that actually manages everything else —
hardware resources, running processes, and the interface I use to control
the machine (in this case, a Linux terminal with no GUI at all).

The OS matters a lot in cloud computing because it's where configuration,
security hardening, and day-to-day administration actually happen. Most
cloud environments run Linux specifically because it's lightweight, free,
stable, and scriptable — ideal for automation at scale. My playground
runs Ubuntu 24.04.4 LTS, confirmed through `cat /etc/os-release`, the
same type of distribution commonly deployed on real-world VMs across AWS,
Azure, or GCP.

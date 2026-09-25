# Cloud Storage Types Research

| Storage Type | Description | Primary Use Case | Cloud Provider Example |
|---|---|---|---|
| Block Storage | Data is broken into fixed-sized blocks, each with a unique identifier, delivered to a VM as a raw, unformatted volume. The OS handles formatting and file system management. | Boot volumes and performance-intensive workloads like transactional databases needing fast, low-latency read/write | Amazon EBS, Azure Disk Storage, Google Persistent Disk |
| File Storage | Data is stored as files inside a hierarchical folder structure, accessed over the network via protocols like NFS or SMB. | Shared directories accessed by multiple VMs/users simultaneously, such as legacy enterprise apps needing a shared network drive | Amazon EFS, Azure Files, Google Cloud Filestore |
| Object Storage | Data is stored in a flat, infinitely scalable "bucket," with each object bundled with metadata and a unique Object ID, accessed via HTTP/HTTPS and REST APIs (like S3). | Storing massive amounts of unstructured data — website images, streaming media, backups, and archives | Amazon S3, Azure Blob Storage, Google Cloud Storage |

## Why Object Storage Is Best for the Client's Photos

For a photo-sharing application expecting millions of user-uploaded
images, Object Storage is the clear choice. Since it doesn't need to
manage complex folder hierarchies or file locking, it scales effortlessly
to petabytes of unstructured data like images, unlike block storage,
which is built for fast, structured data on a single attached volume.
It's also directly accessible over HTTP/HTTPS through simple APIs, making
it easy to integrate with a web application, and far more cost-effective
for storing large volumes of infrequently-changing files like photos.

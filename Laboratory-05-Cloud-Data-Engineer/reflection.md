# Reflection

### 1. Why is object storage better suited for storing millions of photos compared to a traditional block storage hard drive?
Block storage is built to act like a raw hard drive attached to one VM —
great for fast, structured reads/writes, but it doesn't scale well for
massive amounts of unstructured files. Object storage instead stores data
in a flat, infinitely scalable bucket structure, where each file is just
an object with an ID and metadata, no folder hierarchy to manage. That
makes it a much better fit for millions of photos that just need to be
stored and fetched by ID, not organized into a traditional file system.

### 2. How did using Docker make it easier to deploy the MinIO storage server?
Instead of manually installing MinIO, configuring dependencies, and
setting up networking by hand, Docker let me spin up a fully working
object storage server with a single command. The `-e` flags handled
configuration (setting the admin credentials) and `-p` handled exposing
the right ports, all bundled into one reusable, disposable container.

### 3. What is a "bucket" in the context of cloud storage?
A bucket is the top-level container in object storage where files
("objects") are stored. Unlike a folder in a traditional file system,
buckets don't nest into deep hierarchies — objects sit in a flat
structure inside the bucket, each identified by a unique Object ID
rather than a file path.

### 4. How do you think large enterprise companies ensure their object storage data is not lost if the physical server crashes?
This comes down to data replication — continuously duplicating data
across multiple physical drives, server racks, or even different
geographic regions, so a single hardware failure doesn't mean data loss.
Companies also layer backups on top of replication (often following the
3-2-1 backup rule) since replication alone would also copy a corrupted or
accidentally deleted file.

### 5. How is your confidence in navigating the Linux command line growing?
(Personalize this) Five labs in, running Docker commands and managing
containers through the terminal feels a lot more natural than it did in
Lab 1, where I was still getting used to basic commands like `ls` and
`cd`. Deploying an actual working server with one command still feels a
little surreal, but it's making the terminal feel less intimidating and
more like just another tool.

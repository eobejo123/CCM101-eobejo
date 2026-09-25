# MinIO Deployment Documentation

## Docker Command Used
```bash
docker run -d -p 9000:9000 -p 9001:9001 --name minio-server \
-e "MINIO_ROOT_USER=cloudadmin" \
-e "MINIO_ROOT_PASSWORD=CloudNova2026!" \
elestio/minio server /data --console-address ":9001"

## Port Used to Access the Web Console
Port **9001** — accessed through KillerCoda's "Traffic/Ports" tab to open
the MinIO Web Console in the browser.

## Bucket Created
**client-photos**

## What the -e Flags Did
The `-e` flag sets environment variables inside the container at startup.
In this command:
- `MINIO_ROOT_USER=cloudadmin` sets the admin username used to log into
  the MinIO console
- `MINIO_ROOT_PASSWORD=CloudNova2026!` sets the admin password

These environment variables configure MinIO's login credentials without
hardcoding them into the image itself, keeping the container reusable and
its secrets configurable per deployment.

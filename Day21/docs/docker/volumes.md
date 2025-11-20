# Day21: Docker Volumes — Persisting Data Across Containers

## 🔍 What Are Docker Volumes?
Docker volumes are persistent storage units managed by Docker. They allow data to survive container restarts and removals, making them ideal for databases, logs, and user-generated content.

## 🛠️ Types of Volumes
- **Named Volumes**: Created and managed by Docker (`docker volume create`)
- **Anonymous Volumes**: Auto-generated without a name
- **Bind Mounts**: Directly map a host path into the container

## 📦 Creating a Named Volume
```bash
docker volume create mydata

🚀 Using the Volume in a Container
docker run -d --name voltest -v mydata:/app/data busybox

This mounts the mydata volume to /app/data inside the container.

🔍 Inspecting the Volume
docker volume inspect mydata

This shows metadata like mountpoint, driver, and usage.

🧹 Cleaning Up
docker rm -f voltest
docker volume rm mydata


🧠 Summary

Volumes decouple data from containers, enabling:
- Persistent storage
- Easier backups and migration
- Cleaner separation of concerns

They are the preferred method for managing container data in production environments.

---



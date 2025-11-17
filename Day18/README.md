---

# Docker Registry: Tagging and Pushing Custom Images

## Purpose of This Guide

This guide documents the process of tagging and pushing a Docker image to a public registry (Docker Hub). It builds on the optimized image created in Day 17 and reinforces key DevOps principles: versioning, reproducibility, automation, and collaboration.

---

## Step-by-Step Workflow

**1. Build the image from the optimized Dockerfile**

Use the Dockerfile from Day 17, which includes the `hello.sh` script. Build the image locally and name it `myapp-opt`.

**2. Tag the image for Docker Hub**

Tag the image using your Docker Hub username, repository name, and a semantic version tag. For example: `immanuelcoaching/myapp-opt:v1.0`.

Tagging is essential for version control, rollback, and reproducible deployments across environments.

**3. Login to Docker Hub**

Authenticate your CLI session with Docker Hub using the `docker login` command. This step is required before pushing images.

**4. Push the image to Docker Hub**

Push the tagged image to your public registry. Once pushed, the image becomes accessible to CI/CD pipelines, teammates, and other machines.

**5. Pull and run the image (optional)**

To verify the image is publicly available and executable, pull it from Docker Hub and run it. This confirms that your registry workflow is complete.

---

## How Docker Registry Fits into DevOps Workflows

- **Tagging**: Tracks versions of infrastructure, supports rollback, and isolates environments.
- **Pushing**: Publishes images for CI/CD, Kubernetes, and team collaboration.
- **Registry**: Acts as a centralized source of truth for containerized applications.
- **Automation**: Enables pipelines to pull exact versions for testing and deployment.
- **Security**: Supports image scanning, access control, and audit logs.

---

## Learnable Insights

- Docker does not execute CMD during build — only at runtime when the container is run.
- The CMD directive (e.g., `hello.sh`) runs only if no other command is passed during `docker run`.
- You can override CMD by passing a different command, such as `bash`.
- For mandatory execution of a script, consider using ENTRYPOINT instead of CMD.

---

## My take:

This image was built using a multi-stage Dockerfile from Day 17, optimized for size and clarity. Tagging and pushing it to Docker Hub enables reproducible deployments and CI/CD integration. This mirrors real-world DevOps workflows where infrastructure is versioned, shared, and automated.

---


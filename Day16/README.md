ocker Hello World Demo

This repository contains a minimal Docker setup that runs a simple shell script inside an Alpine-based container. It’s a simple, beginner-friendly example showing how to copy files, set permissions, and execute scripts in Docker.

🚀 What This Demo Does

Running this Docker image prints the following:

Hello from inside a Docker container!

This is my first work with Docker!

This demo shows:

Using Alpine Linux as a lightweight base image

Copying files into a Docker container

Making a script executable

Running a shell script using CMD

📁 Project Structure

Dockerfile
hello.sh

🐳 How to Build and Run

Build the Docker image:
docker build -t docker-hello-demo .

Run the container:
docker run --rm docker-hello-demo

Expected output:
Hello from inside a Docker container!
(This is my first work with Docker!)

📜 Files

Dockerfile:
From alpine:latest
COPY hello.sh /hello.sh
RUN chmod +x /hello.sh
CMD ["/hello.sh"]

hello.sh:
#!/bin/sh
echo "Hello from inside a Docker container!"
echo ""
echo ""
echo "This is my first work with Docker!"

🎯 Why This Project Is Useful

Perfect starting point for Docker beginners

Shows how to run custom scripts inside containers

Lightweight and easy to extend for future experiments

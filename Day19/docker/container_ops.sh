#!/bin/bash
# container_ops.sh - Basic Docker container lifecycle commands
# Author: Immanuel Santosh
# Purpose: Demonstrate essential Docker container management operations

set -e

CONTAINER_NAME="demo_nginx"

echo "🚀 Running a new container..."
docker run -d --name $CONTAINER_NAME nginx

echo "📋 Listing all containers (including stopped)..."
docker ps -a

echo "📜 Fetching logs from $CONTAINER_NAME..."
docker logs $CONTAINER_NAME

echo "🛑 Stopping $CONTAINER_NAME..."
docker stop $CONTAINER_NAME

echo "🧹 Removing $CONTAINER_NAME..."
docker rm $CONTAINER_NAME

echo "✅ Container lifecycle demo complete."

#!/bin/bash
# Day21 - Docker Volumes Demo Script
# Author: Immanuel
# Purpose: Demonstrate volume creation, usage, inspection, and cleanup

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker to run this script."
    exit 1
fi

echo "✅ Creating a named volume: mydata"
docker volume create mydata

echo "🚀 Running a container with the volume mounted at /app/data"
docker run -d --name voltest -v mydata:/app/data busybox

echo "🔍 Inspecting the volume:"
docker volume inspect mydata

echo "🧹 Cleaning up: removing container and volume"
docker rm -f voltest
docker volume rm mydata

echo "✅ Done. Volume lifecycle demo complete."

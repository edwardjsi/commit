# Day 17 – Dockerfile Optimization & Symlink Learning

## 🧠 Goal
Refactor the Day16 Dockerfile to follow best practices for minimal, reproducible container builds using Alpine Linux. Also explored symbolic links (symlinks) to understand how files can be referenced across folders without duplication.

## 🔧 What Changed
- Switched from `alpine:latest` to `alpine:3.18` for reproducibility
- Added `WORKDIR /app` for cleaner file structure
- Installed only required packages (`openssh`)
- Used `COPY`, `chmod`, and `CMD` in a structured, readable way
- Created a standalone `Dockerfile.optimised` in Day17

## 🚀 How to Build and Run
```bash
cd Day17
docker build -f Dockerfile.optimised -t ssh-script:optimized .
docker run ssh-script:optimized

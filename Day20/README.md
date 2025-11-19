# Day 20: Docker Networking Overview

This README provides a conceptual summary of Docker's networking modes—**bridge**, **host**, and **user-defined**—and explains when and why to use each. For full commands and troubleshooting, see [`/docs/docker/networking.md`](./docs/docker/networking.md).

---

## 🧠 Why Networking Matters in Docker

Docker containers are isolated by default. Networking allows them to:
- Communicate with each other
- Access external services
- Simulate real-world microservice environments

---

## 🌉 Bridge Network (Default)

- Docker’s default network mode
- Containers get private IPs and NAT to host
- Cannot resolve each other by name
- Best for simple, isolated setups

---

## 🖥️ Host Network

- Container shares host’s network stack
- No isolation—container uses host’s IP and ports
- Only available on Linux
- Useful for performance-critical or low-latency apps

---

## 🔗 User-Defined Bridge Network

- Custom bridge network created with `docker network create`
- Containers can resolve each other by name (built-in DNS)
- Ideal for multi-container setups and microservices
- Preferred for reproducibility and clarity

---

## 🧪 Summary Table

| Network Type      | Isolation | DNS Support | Use Case                          |
|-------------------|-----------|-------------|-----------------------------------|
| Bridge (default)  | Yes       | No          | Simple, isolated containers       |
| Host              | No        | N/A         | Performance-critical, Linux only |
| User-defined      | Yes       | Yes         | Multi-container communication     |

---

## 📎 Related File

- [`networking.md`](./docs/docker/networking.md): Full hands-on guide with commands, troubleshooting, and cleanup steps.

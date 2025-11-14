# Day 15: Virtualization vs Containerization

## 🔍 Overview
This document compares virtualization and containerization—two foundational technologies in modern infrastructure and DevOps workflows.

## 🧱 Virtualization
Virtualization abstracts the **hardware layer** using a hypervisor to run multiple virtual machines (VMs), each with its own OS.

- **Isolation**: Strong—each VM is fully independent.
- **Resource Usage**: Heavy—each VM runs a full OS.
- **Boot Time**: Minutes.
- **Use Case**: Legacy apps, full OS environments, multi-tenant hosting.

## 📦 Containerization
Containerization abstracts the **OS layer**, allowing multiple containers to share the host kernel while isolating processes.

- **Isolation**: Lightweight—process-level via namespaces and cgroups.
- **Resource Usage**: Efficient—no full OS per container.
- **Boot Time**: Seconds.
- **Use Case**: Microservices, CI/CD pipelines, cloud-native apps.

## ⚙️ DevOps Relevance
As a DevOps engineer, containerization enables:

- Faster deployments and rollbacks.
- Environment consistency across dev, test, and prod.
- Scalable orchestration via Kubernetes.
- Efficient CI/CD pipelines.

## 🧪 Summary
| Feature           | Virtualization        | Containerization       |
|------------------|------------------------|------------------------|
| Abstraction Level| Hardware               | Operating System       |
| Isolation        | Full OS per VM         | Process-level          |
| Resource Usage   | High                   | Low                    |
| Portability      | Limited                | High                   |
| Boot Time        | Slow                   | Fast                   |
| DevOps Fit       | Legacy infra           | Cloud-native workflows |

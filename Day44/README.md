# Day 44 – Kubernetes Probes (Liveness & Readiness)

## Goal

Understand and implement Kubernetes liveness and readiness probes to enable self-healing and safe traffic handling for applications.

## What I did

* Added readiness probes to ensure Pods receive traffic only when the application is ready.
* Added liveness probes to automatically restart containers when the application becomes unresponsive.
* Tuned probe timings to avoid premature restarts during startup.

## What this proves

* I understand the difference between application health and traffic readiness.
* I can design Kubernetes workloads that recover automatically from failures.
* I know how Kubernetes uses probes to achieve zero-downtime deployments.

## How this helps a client/employer

* Prevents users from hitting unhealthy Pods.
* Enables automatic recovery without manual intervention.
* Improves application reliability and production stability.

---



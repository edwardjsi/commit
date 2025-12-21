---

# Day 45 – Kubernetes ConfigMap (Application Configuration)

## Goal

Externalize application configuration using a Kubernetes ConfigMap so configuration changes do not require rebuilding container images.

---

## What I did

* Learned the purpose of a Kubernetes ConfigMap and when to use it.
* Created a ConfigMap YAML to store application configuration variables (app name, environment, log level, port).
* Stored the ConfigMap as a Kubernetes manifest under the infrastructure directory.
* Understood how ConfigMaps can be consumed by pods as environment variables or mounted files.

---

## What this proves

* I understand the **separation of configuration from application code** (12-factor app principle).
* I know how Kubernetes manages non-sensitive configuration data.
* I can design containerized applications that are **environment-agnostic**.
* I understand the difference between **ConfigMaps and Secrets** and when to use each.

---

## How this helps a client/employer

* Allows application configuration changes without rebuilding or redeploying container images.
* Enables the same container image to be promoted safely across dev, test, and production.
* Improves maintainability, consistency, and reliability of Kubernetes deployments.
* Reduces deployment risk by keeping configuration version-controlled and explicit.

---


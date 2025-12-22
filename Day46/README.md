---

# Day 46 – Kubernetes Secrets (Opaque)

## Goal

Understand how Kubernetes Secrets work by creating an Opaque Secret to store a database password (learning purpose only).

## What I did

* Created a Kubernetes **Opaque Secret** YAML to store a database password as key–value data.
* Base64-encoded the password, as required by Kubernetes Secrets.
* Stored the manifest at `/infra/kubernetes/manifests/app-secret.yaml`, following clean infra structure.

## What this proves

* I understand how Kubernetes handles sensitive data using Secrets.
* I know that Secrets require **base64 encoding**, not plain text.
* I’m aware of the **security limitations** of Opaque Secrets and why they’re not production-grade.

## How this helps a client/employer

* I can securely inject configuration values (like DB passwords) into Pods using Kubernetes Secrets.
* I understand when **not** to use plain Kubernetes Secrets and can recommend safer alternatives such as external secret managers.


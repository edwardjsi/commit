# Day 48 – Kubernetes Service (ClusterIP)

## Goal

Expose an application Deployment internally using a Kubernetes Service of type ClusterIP.

---

## What I did

* Created a Kubernetes **Service** manifest of type **ClusterIP** to provide a stable internal endpoint.
* Linked the Service to the application Pods using label selectors instead of hardcoded Pod IPs.
* Mapped an external Service port to the container’s actual listening port for internal traffic routing.

---

## What this proves

* I understand why **Services exist in Kubernetes**, not just how to write YAML.
* I know that Pods are ephemeral and should never be accessed directly via IP addresses.
* I can design reliable, load-balanced internal networking for microservices.

---

## How this helps a client/employer

* I can expose applications safely **inside the cluster** without unnecessary public access.
* I can design scalable service-to-service communication using Kubernetes-native networking.
* I can troubleshoot connectivity issues related to Services, selectors, and port mappings.

---


# Day 48 – Kubernetes Service (NodePort)

## Goal

Expose a Kubernetes application externally using a NodePort Service and validate access via Node IP and NodePort.

---

## What I did

* Updated the existing Kubernetes Service to use `type: NodePort`.
* Explicitly defined a NodePort within the valid range (30000–32767).
* Applied the Service manifest and verified successful creation.
* Accessed the application externally using `<NodeIP>:<NodePort>` via browser/curl.

---

## What this proves

* I understand how Kubernetes Services route traffic from outside the cluster to Pods.
* I know the difference between `port`, `targetPort`, and `nodePort`.
* I can validate and troubleshoot Kubernetes networking instead of blindly applying YAML.

---

## How this helps a client/employer

* I can expose internal applications safely for testing and demos.
* I can debug service-access issues related to selectors, ports, and Pod connectivity.
* I understand when NodePort is appropriate and when production-grade solutions like LoadBalancer or Ingress are required.

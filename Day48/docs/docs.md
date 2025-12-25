# Day 49 – Kubernetes Service (NodePort)

## Goal

Expose an application running in Kubernetes outside the cluster using a **NodePort Service** and verify access via **Node IP + NodePort**.

---

## Concept Overview

By default, Kubernetes applications are only reachable **inside the cluster**. A **Service** provides a stable networking layer to expose Pods.

A **NodePort Service**:

* Opens a fixed port on **every worker node**
* Routes traffic from `NodeIP:NodePort` → Service → Pod
* Is mainly used for **learning, testing, demos, and interviews**

**Traffic Flow:**

```
Browser / curl
   ↓
Node IP : NodePort
   ↓
Kubernetes Service
   ↓
Application Pod
```

---

## File Updated

```
/infra/kubernetes/manifests/app-service.yaml
```

---

## Updated Service YAML (NodePort)

```yaml
apiVersion: v1
kind: Service
metadata:
  name: app-service
spec:
  type: NodePort
  selector:
    app: my-app
  ports:
    - protocol: TCP
      port: 80          # Service port inside the cluster
      targetPort: 8080  # Container port exposed by the Pod
      nodePort: 30007   # External port exposed on each Node (30000–32767)
```

---

## Explanation of Key Fields

* **type: NodePort**
  Exposes the service externally on all cluster nodes

* **selector**
  Matches Pods with label `app: my-app`

* **port**
  Port used by other Kubernetes resources inside the cluster

* **targetPort**
  Actual port on which the application runs inside the container

* **nodePort**
  Port opened on the Node for external access

---

## Apply the Service

```bash
kubectl apply -f infra/kubernetes/manifests/app-service.yaml
```

Verify creation:

```bash
kubectl get svc
```

Expected output (example):

```text
NAME          TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)
app-service   NodePort   10.96.45.123   <none>        80:30007/TCP
```

---

## Get the Node IP

```bash
kubectl get nodes -o wide
```

Example:

```text
NAME     INTERNAL-IP
node-1   192.168.1.100
```

---

## Test External Access

### Using Browser

```
http://192.168.1.100:30007
```

### Using curl

```bash
curl http://192.168.1.100:30007
```

If the application responds, the NodePort Service is working correctly.

---

## Common Troubleshooting Checks

If access fails, validate the following:

1. Pods are running:

   ```bash
   kubectl get pods
   ```

2. Service selector matches Pod labels:

   ```bash
   kubectl describe svc app-service
   ```

3. Application is listening on the correct container port (`8080`)

4. Firewall / Security Group allows NodePort range (30000–32767)

---

## When to Use NodePort (and When Not)

**Good for:**

* Learning Kubernetes networking
* Local clusters (Minikube, Kind)
* Interviews and demos

**Not recommended for:**

* Production workloads
* Internet-facing applications at scale

For production, prefer **LoadBalancer** or **Ingress**.

---

## What This Task Demonstrates

* Clear understanding of Kubernetes Service types
* Ability to expose applications externally
* Practical debugging and verification skills
* Strong grasp of real-world Kubernetes networking flow

---

## Repository Outcome

This task updates the Service manifest to NodePort and validates external access using Node IP and NodePort — a foundational Kubernetes skill every DevOps engineer must master.

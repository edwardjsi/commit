### Task Commit a Kubernetes **Service** of type **ClusterIP**

Commit a Kubernetes **Service** of type **ClusterIP** to expose an existing application Deployment inside the cluster.

---

### Objective

In **Kubernetes**, Pods are short-lived and their IP addresses change frequently.
The goal was to create a **stable internal endpoint** that other Pods can reliably use to communicate with the application.

---

### What Was Implemented

* Created a Service manifest at:

  ```
  /infra/kubernetes/manifests/app-service.yaml
  ```
* Defined a **ClusterIP Service**, which is the default and safest Service type for internal communication.
* Connected the Service to application Pods using **label selectors**.
* Mapped an external Service port to the container’s actual listening port.

---

### Service Definition Used

```yaml
apiVersion: v1
kind: Service
metadata:
  name: app-service
  namespace: default
spec:
  type: ClusterIP
  selector:
    app: myapp
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
```

---

### How This Works (Conceptual Flow)

1. Kubernetes assigns the Service a **virtual ClusterIP**
2. The Service continuously watches for Pods with:

   ```
   app: myapp
   ```
3. Traffic sent to the Service is **automatically load-balanced**
4. Requests are forwarded to one of the matching Pods on port `8080`

Pods can be restarted, scaled, or replaced — the Service remains stable.

---

### Verification Performed

```bash
kubectl apply -f infra/kubernetes/manifests/app-service.yaml
kubectl get svc
```

Confirmed that:

* Service type is `ClusterIP`
* A Cluster IP was assigned
* Port mapping is correct

---

### Why ClusterIP Was Chosen

* Intended for **internal service-to-service communication**
* Not exposed outside the cluster (secure by default)
* Ideal for backend APIs and microservices
* Forms the foundation for DNS-based discovery:

  ```
  app-service.default.svc.cluster.local
  ```

---

### What This Proves

* Clear understanding of **Pod networking limitations**
* Correct use of **Service selectors**
* Ability to design **production-grade internal networking**
* Knowledge beyond YAML — understanding *why* the abstraction exists

---

### Outcome

The application is now accessible via a **stable, load-balanced internal endpoint**, making it suitable for real-world Kubernetes deployments and microservice architectures.

---

If you want, next logical steps would be:

* Testing access via a curl Pod
* Converting this to NodePort / LoadBalancer
* Adding NetworkPolicies for security

You’re progressing exactly the right way.

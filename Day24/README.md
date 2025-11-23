# Day24 – AWS Load Balancer Theory

This day focuses on understanding **AWS Elastic Load Balancing (ELB)** and its three main types:

- **Classic Load Balancer (CLB)** → Legacy option, basic Layer 4 & 7 load balancing.
- **Application Load Balancer (ALB)** → Modern Layer 7 routing, supports microservices, APIs, and containerized workloads.
- **Network Load Balancer (NLB)** → High‑performance Layer 4 load balancing, ultra‑low latency, preserves client IPs.

It also introduces the concept of **Target Groups**, which decouple load balancers from compute resources and enable flexible routing with health checks.

## 📂 Structure
- `docs/aws-core/elb-theory.md` → Detailed notes on CLB, ALB, NLB, and Target Groups  
- `diagrams/elb-flow.png` → Traffic flow diagram (client → load balancer → target group → backend)  
- `examples/target-groups.json` → Sample target group configuration for EC2 and IP targets  
- `scripts/` → Placeholder for hands‑on setup scripts  

## ✅ Outcome
By the end of Day24, you have:
- A clear theoretical foundation on AWS load balancers.
- Practical artifacts (diagram + JSON config) to demonstrate understanding.
- A modular repo structure ready for interview discussions and future hands‑on demos.

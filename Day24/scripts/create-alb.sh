#!/bin/bash

# Create Day24 folder structure
mkdir -p Day24/docs/aws-core
mkdir -p Day24/diagrams
mkdir -p Day24/examples
mkdir -p Day24/scripts

# Create placeholder diagram image file
# (empty file for now, you can replace with a real diagram later)
touch Day24/diagrams/elb-flow.png

# Create target-groups.json with sample content
cat << 'EOF' > Day24/examples/target-groups.json
{
  "TargetGroups": [
    {
      "Name": "web-app-tg",
      "Protocol": "HTTP",
      "Port": 80,
      "TargetType": "instance",
      "HealthCheck": {
        "Protocol": "HTTP",
        "Path": "/health",
        "IntervalSeconds": 30,
        "TimeoutSeconds": 5,
        "HealthyThresholdCount": 3,
        "UnhealthyThresholdCount": 2
      },
      "Targets": [
        { "Id": "i-0123456789abcdef0", "Port": 80 },
        { "Id": "i-0fedcba9876543210", "Port": 80 }
      ]
    },
    {
      "Name": "api-service-tg",
      "Protocol": "HTTP",
      "Port": 8080,
      "TargetType": "ip",
      "HealthCheck": {
        "Protocol": "HTTP",
        "Path": "/status",
        "IntervalSeconds": 20,
        "TimeoutSeconds": 5,
        "HealthyThresholdCount": 2,
        "UnhealthyThresholdCount": 2
      },
      "Targets": [
        { "Id": "10.0.1.25", "Port": 8080 },
        { "Id": "10.0.1.26", "Port": 8080 }
      ]
    }
  ]
}
EOF

# Create README.md with AWS Load Balancer theory
cat << 'EOF' > Day24/docs/aws-core/elb-theory.md
# AWS Load Balancer Theory

Elastic Load Balancing (ELB) is an AWS-managed service that automatically distributes incoming traffic across multiple targets (like EC2 instances, containers, or IP addresses) to ensure high availability and fault tolerance. AWS offers three main types of load balancers: **Classic Load Balancer (CLB)**, **Application Load Balancer (ALB)**, and **Network Load Balancer (NLB)**. Each is designed for different use cases.

---

## 🔹 Classic Load Balancer (CLB)
- Legacy option: First-generation load balancer, now largely replaced by ALB/NLB.
- Operates at both Layer 4 (TCP) and Layer 7 (HTTP/HTTPS).
- Basic load balancing across multiple EC2 instances.
- Limited routing features compared to ALB.
- Use case: Simple applications that only need basic load distribution.

---

## 🔹 Application Load Balancer (ALB)
- Operates at Layer 7 (HTTP/HTTPS).
- Advanced routing based on content (host-based, path-based).
- Supports WebSockets and HTTP/2.
- Native integration with ECS/EKS for containerized workloads.
- Can route traffic to multiple microservices behind a single ALB.
- Use case: Modern web applications, microservices, APIs, and containerized environments.

---

## 🔹 Network Load Balancer (NLB)
- Operates at Layer 4 (TCP/UDP).
- Extremely high performance, capable of handling millions of requests per second.
- Ultra-low latency.
- Preserves client IP addresses.
- Supports TLS termination.
- Use case: High-throughput, latency-sensitive applications such as gaming, IoT, or financial systems.

---

## 🔹 Target Groups
- Logical grouping of targets (EC2 instances, IP addresses, Lambda functions, or containers).
- Each ALB or NLB must be associated with one or more target groups.
- Health checks are performed per target group to ensure only healthy targets receive traffic.
- Enables flexible routing: different rules can send traffic to different target groups.
- Benefit: Decouples the load balancer from the actual compute resources, making scaling and management easier.

---

## ✅ Summary
- **CLB**: Legacy, basic load balancing (Layer 4 & 7).
- **ALB**: Modern, feature-rich, Layer 7 routing for web/microservices.
- **NLB**: High-performance, Layer 4 load balancing for extreme scale and low latency.
- **Target Groups**: Core concept for routing traffic to healthy, logical sets of resources.

EOF

# Create high-level README.md for Day24
cat << 'EOF' > Day24/README.md
# Day24 – AWS Load Balancer Theory

This day focuses on understanding AWS Elastic Load Balancing (ELB) and its three main types:
- Classic Load Balancer (CLB)
- Application Load Balancer (ALB)
- Network Load Balancer (NLB)

It also introduces the concept of **Target Groups**.

## 📂 Structure
- **docs/aws-core/elb-theory.md** → Detailed theory notes
- **diagrams/elb-flow.png** → Traffic flow diagram (placeholder)
- **examples/target-groups.json** → Sample target group configuration
- **scripts/** → Placeholder for hands-on setup scripts

EOF

echo "✅ Day24 directory structure, files, and README created successfully."

AWS Load Balancer Theory

Elastic Load Balancing (ELB) is an AWS-managed service that automatically distributes incoming traffic across multiple targets (like EC2 instances, containers, or IP addresses) to ensure high availability and fault tolerance. AWS offers three main types of load balancers: Classic Load Balancer (CLB), Application Load Balancer (ALB), and Network Load Balancer (NLB). Each is designed for different use cases.

🔹 Classic Load Balancer (CLB)
- Legacy option: First-generation load balancer, now largely replaced by ALB/NLB.
- Layer support: Operates at both Layer 4 (TCP) and Layer 7 (HTTP/HTTPS).
- Features:
- Basic load balancing across multiple EC2 instances.
- Limited routing features compared to ALB.
- No support for modern microservices or containerized workloads.
- Use case: Simple applications that only need basic load distribution.


🔹 Application Load Balancer (ALB)
- Layer support: Operates at Layer 7 (HTTP/HTTPS).
- Features:
- Advanced routing based on content (host-based, path-based).
- Supports WebSockets and HTTP/2.
- Native integration with ECS/EKS for containerized workloads.
- Can route traffic to multiple microservices behind a single ALB.
- Use case: Modern web applications, microservices, APIs, and containerized environments.


🔹 Network Load Balancer (NLB)
- Layer support: Operates at Layer 4 (TCP/UDP).
- Features:
- Extremely high performance, capable of handling millions of requests per second.
- Ultra-low latency.
- Preserves client IP addresses.
- Supports TLS termination.
- Use case: High-throughput, latency-sensitive applications such as gaming, IoT, or financial systems.

🔹 Target Groups
- Definition: Logical grouping of targets (EC2 instances, IP addresses, Lambda functions, or containers) that a load balancer routes traffic to.
- Key points:
- Each ALB or NLB must be associated with one or more target groups.
- Health checks are performed per target group to ensure only healthy targets receive traffic.
- Enables flexible routing: different rules can send traffic to different target groups.
- Benefit: Decouples the load balancer from the actual compute resources, making scaling and management easier.

✅ Summary
- CLB: Legacy, basic load balancing (Layer 4 & 7).
- ALB: Modern, feature-rich, Layer 7 routing for web/microservices.
- NLB: High-performance, Layer 4 load balancing for extreme scale and low latency.
- Target Groups: Core concept for routing traffic to healthy, logical sets of resources.



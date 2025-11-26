AWS RDS Theory

📖 Overview

Amazon Relational Database Service (RDS) is a managed service that simplifies the setup, operation, and scaling of relational databases in the cloud. It automates tasks such as provisioning, patching, backups, recovery, and scaling, allowing developers to focus on application logic instead of database administration.


⚙️ DB Engine Creation

• 	Supported Engines: MySQL, PostgreSQL, MariaDB, Oracle, SQL Server, and Amazon Aurora.
• 	Creation Options:
• 	Via AWS Console (guided wizard).
• 	Via AWS CLI ().
• 	Via Infrastructure as Code (Terraform/CloudFormation).
• 	Key Parameters:
• 	Engine type and version.
• 	Instance class (e.g., ).
• 	Storage type (General Purpose SSD, Provisioned IOPS).
• 	VPC, subnet group, and security group.
• 	Backup retention and maintenance window.

🏛️ Multi‑AZ Deployment
• 	Purpose: High availability and durability.
• 	How it works:
• 	RDS automatically provisions a standby replica in a different Availability Zone (AZ).
• 	Synchronous replication ensures data consistency.
• 	In case of primary failure, RDS performs automatic failover to the standby.
• 	Benefits:
• 	Increased fault tolerance.
• 	Minimal downtime during maintenance or AZ outages.
• 	Transparent to applications (same endpoint).

📚 Read Replicas
• 	Purpose: Scalability and performance optimization.
• 	How it works:
• 	Asynchronous replication from the primary DB to one or more replicas.
• 	Replicas can be promoted to standalone databases.
• 	Use Cases:
• 	Offloading read‑heavy workloads.
• 	Supporting analytics/reporting queries without impacting primary DB.
• 	Disaster recovery (manual promotion).
• 	Limitations:
• 	Replication lag may occur.
• 	Not a substitute for Multi‑AZ (no automatic failover).


🔑 Key Differences: Multi‑AZ vs Read Replicas

the key differences between Multi‑AZ and Read Replicas written out in clear text form instead of a table:
• 	Replication type: Multi‑AZ uses synchronous replication, ensuring the standby copy is always up to date. Read Replicas use asynchronous replication, which means they can lag slightly behind the primary.
• 	Purpose: Multi‑AZ is designed for high availability and durability, protecting against failures. Read Replicas are designed for scalability and performance, offloading read traffic.
• 	Failover behavior: Multi‑AZ provides automatic failover to the standby instance if the primary fails. Read Replicas require manual promotion if you want them to act as a new primary.
• 	Endpoints: With Multi‑AZ, your application continues to use the same database endpoint regardless of failover. With Read Replicas, each replica has its own endpoint, so applications must be configured to direct read queries there.
• 	Use cases: Multi‑AZ is best for fault tolerance and business continuity, while Read Replicas are best for read‑heavy workloads, analytics, and scaling out queries.

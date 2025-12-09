# Day37 – Terraform Security Group

## Goal
Define firewall rules using Terraform to securely control access to an EC2 instance.

## What I did
- Created a Terraform security group for SSH and HTTP access.
- Defined inbound rules for ports 22 and 80.
- Configured outbound access for all destinations.
- Separated security logic into its own file (`security.tf`).
- Referenced the security group from the EC2 resource configuration.

## What this proves
- I understand how AWS security groups work at the network level.
- I can express firewall rules as infrastructure code.
- I can structure infrastructure configs across multiple files.
- I know why networking rules should never be hardcoded manually in production.
- I understand how Terraform handles dependencies implicitly.

## How this helps a client/employer
- I can secure EC2 instances from the first deployment.
- I can restrict and expose network ports correctly.
- I can manage firewall rules consistently using code.
- I can reduce misconfiguration risk through automation.

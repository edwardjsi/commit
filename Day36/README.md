# Day36 – Terraform EC2 Instance

## Goal
Provision a basic EC2 instance using Terraform and place it correctly in a public subnet.

## What I did
- Wrote Terraform configuration to launch a `t2.micro` instance.
- Configured the AWS provider and defined a security group for SSH and HTTP access.
- Set the instance to receive a public IP by placing it in a public subnet.
- Added tags to improve identification and resource management.

## What this proves
- I can write infrastructure as code instead of clicking in the console.
- I understand how networking and security groups affect EC2 accessibility.
- I can structure Terraform code in a way that is readable and reusable.
- I know how to provision compute resources declaratively.

## How this helps a client/employer
- I can provision repeatable EC2 infrastructure using Terraform.
- I can configure public access securely for workloads and testing environments.
- I can maintain infrastructure through version control.
- I can automate VM creation instead of relying on manual setup.

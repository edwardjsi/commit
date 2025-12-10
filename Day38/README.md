# Day 38 – Terraform Provisioners (Remote-Exec)

## Goal
Automatically install and configure Docker on a newly created EC2 instance using Terraform’s `remote-exec` provisioner.

## What I did
- Created an EC2 instance inside a custom VPC and public subnet.
- Configured SSH access using a private key and Terraform `connection` block.
- Used Terraform `remote-exec` provisioner to:
  - Update the OS packages.
  - Install Docker.
  - Enable Docker at boot.
  - Start the Docker service automatically.
- Verified installation by SSHing into the instance and checking `docker --version`.

## What this proves
- I understand how Terraform interacts with live servers beyond resource creation.
- I can debug SSH issues, security group rules, and authentication problems.
- I know where provisioners fit in real-world DevOps workflows (and where they shouldn’t).
- I understand the trade-offs between automation convenience and architectural best practices.

## How this helps a client/employer
- I can automate server bootstrapping instead of manual setup.
- I can ensure new servers are production-ready immediately after provisioning.
- I can reduce configuration inconsistencies between environments.
- I understand when to use provisioners and when to move to cleaner approaches like user data, Packer, or Ansible.

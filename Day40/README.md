# Day 40 – Terraform: S3 Bucket with Versioning and Lifecycle Policy

## Goal
Provision an AWS S3 bucket using Terraform with versioning enabled and lifecycle rules for cost optimization.

## What I did
- Created an S3 bucket using Terraform with a variable-driven bucket name.
- Enabled bucket versioning to protect against accidental deletes and overwrites.
- Configured lifecycle policies to transition objects to cheaper storage classes and clean up old versions automatically.
- Used `terraform.tfvars` to supply runtime variables instead of hardcoding values.
- Ran Terraform entirely from a WSL-based Linux environment via VS Code.

## What this proves
- I understand how Terraform separates infrastructure definition from variable inputs.
- I know how to design S3 storage with durability, safety, and cost control in mind.
- I can manage Terraform state and locking correctly in a Linux execution environment.
- I follow best practices by keeping credentials out of code and using the AWS CLI for authentication.

## How this helps a client/employer
- I can provision secure, versioned S3 storage for logs, backups, and application data.
- I can reduce long-term storage costs using lifecycle policies without manual intervention.
- I can set up reproducible infrastructure using Terraform that is safe to run and easy to maintain.
- I can work comfortably in real-world setups using WSL, VS Code, and AWS tooling.

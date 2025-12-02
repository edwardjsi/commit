# Day 31 — Terraform Introduction (AWS Provider & Versioning)

## Purpose of This Task

The objective of Day 31 is to set up a **stable and production-ready Terraform foundation** before provisioning any infrastructure.

Instead of creating AWS resources immediately, this task focuses on:
- Locking Terraform and provider versions
- Establishing a clean AWS provider configuration
- Preparing the project for scalable infrastructure as code

This mirrors how real DevOps teams bootstrap Terraform in enterprise environments.

---

## What Was Implemented

### 1. Terraform Version Constraint

```hcl
terraform {
  required_version = ">= 1.6.0"
}

Why this is important:

Terraform frequently introduces changes across versions.
Locking a minimum version ensures:

All team members run compatible versions

CI pipelines behave consistently

Code does not break due to outdated Terraform binary

The environment is reproducible across systems	

2. Provider Version Control


required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 5.0"
  }
}

Why this is important:

Providers evolve independently from Terraform.
Pinning the AWS provider protects against breaking changes caused by:

* Auto-upgrades

* Deprecated APIs

* Silent behavior changes

* Schema updates

This makes infrastructure stable across:

* Redeployments

* Team laptops

* CI/CD servers

3. AWS Provider Configuration

provider "aws" {
  region = var.aws_region
}

Why this is important:

Terraform needs to know:

* Which cloud service to use (AWS)

* Which region to interact with

By using a variable:

* Code becomes portable

* Regions can be changed without modifying files

* Environment-specific configs become possible

This is standard DevOps practice.

4. Region Variable Definition

variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "ap-south-1"
}


Why this is important:

Variables enable:

* Flexibility

* Reusability

CI/CD pipeline injection

Multi-environment deployments

A default value allows:

* Quick local testing

* Simple onboarding for new users

* No dependency on external configuration

What This Task Enables Later

This file becomes the backbone for all future infrastructure.

It enables:

* Version-safe builds

* Predictable deployments

* Provider control

* CI/CD integration

* Scalable architecture

* Multi-region readiness

All actual infrastructure depends on this foundation.

What This Task Does NOT Do

This configuration:

* Does not create AWS resources

* Does not incur cost

* Does not provision infrastructure

* Does not touch existing systems

It exists only to prepare Terraform correctly.

DevOps Perspective

In production:

Bad versioning → broken pipelines
Loose providers → outages
No constraints → unpredictable infrastructure

This task enforces one core principle:

Infrastructure should be reliable, boring, and repeatable.

Next Steps

Upcoming tasks will include:

Creating real AWS resources

Managing Terraform state

Adding outputs and variables

Remote backends

Locking and concurrency control

The groundwork is now complete.

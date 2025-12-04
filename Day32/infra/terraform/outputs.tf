# ==============================
# Terraform Outputs - Day 32
# ==============================

# These outputs demonstrate how Terraform
# exposes infrastructure details after provisioning.
# No provider or resource is required to understand the pattern.

output "environment" {
  description = "Deployment environment"
  value       = var.environment
}

output "region" {
  description = "Target AWS region"
  value       = var.region
}

output "project_name" {
  description = "Project identification"
  value       = var.project_name
}

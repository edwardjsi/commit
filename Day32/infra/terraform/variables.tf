# ==============================
# Terraform Variables - Day 32
# ==============================

# Region where resources would normally be created
variable "region" {
  description = "AWS region for infrastructure deployment"
  type        = string
  default     = "ap-south-1"
}

# Environment of deployment
variable "environment" {
  description = "Environment name (dev, test, prod)"
  type        = string
  default     = "dev"
}

# Project identifier
variable "project_name" {
  description = "Logical project name for tagging and organization"
  type        = string
  default     = "terraform-learning"
}

# Networking space
variable "vpc_cidr" {
  description = "CIDR block for virtual private cloud"
  type        = string
  default     = "10.0.0.0/16"
}

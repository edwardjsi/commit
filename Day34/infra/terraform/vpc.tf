############################################################
# Day 34 – Terraform VPC & Internet Gateway
# File: infra/terraform/vpc.tf
#
# Assumption:
# - AWS provider is already defined in another file
#   (e.g., provider.tf or main.tf)
############################################################

# AWS VPC
resource "aws_vpc" "main" {
  # Core VPC network range
  cidr_block = "10.0.0.0/16"

  # Recommended for most workloads
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "day34-main-vpc"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}

# Internet Gateway attached to the VPC
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "day34-main-igw"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}

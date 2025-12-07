############################################################
# Day 35 – Terraform Subnets with Loops
# File: infra/terraform/subnets.tf
#
# Goal:
#   Create multiple public and private subnets efficiently
#   using for_each, instead of repeating resource blocks.
#
# Assumes:
#   - aws_vpc.main is defined in vpc.tf
############################################################

# Define subnet metadata in locals so we can loop over them
locals {
  public_subnets = {
    public-a = {
      cidr = "10.0.1.0/24"
      az   = "ap-south-1a"
    }
    public-b = {
      cidr = "10.0.2.0/24"
      az   = "ap-south-1b"
    }
  }

  private_subnets = {
    private-a = {
      cidr = "10.0.11.0/24"
      az   = "ap-south-1a"
    }
    private-b = {
      cidr = "10.0.12.0/24"
      az   = "ap-south-1b"
    }
  }
}

############################################################
# Public Subnets (for_each loop)
############################################################

resource "aws_subnet" "public" {
  for_each = local.public_subnets

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = {
    Name        = "day35-${each.key}"
    Environment = "dev"
    Type        = "public"
    ManagedBy   = "terraform"
  }
}

############################################################
# Private Subnets (for_each loop)
############################################################

resource "aws_subnet" "private" {
  for_each = local.private_subnets

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = false

  tags = {
    Name        = "day35-${each.key}"
    Environment = "dev"
    Type        = "private"
    ManagedBy   = "terraform"
  }
}

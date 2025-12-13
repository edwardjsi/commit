#!/bin/bash
# File: create_project_files.sh
# Purpose: Generates all Terraform configuration files and the project README.md,
# documenting the evolution of the code and the fixes applied to errors encountered.

echo "Creating Terraform project files..."

# --- 1. main.tf (Provider and Data Source) ---
cat > main.tf << 'EOF'
# main.tf

# ----------------------------------------------------
# Provider Configuration
# ----------------------------------------------------
provider "aws" {
  region = var.aws_region
}

# ----------------------------------------------------
# Data Source: Get Base AMI ID
# ----------------------------------------------------
data "aws_ami" "base_os" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    # Find a current, supported Ubuntu server image
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

# ----------------------------------------------------
# Variable Configuration
# ----------------------------------------------------
variable "aws_region" {
  description = "The AWS region to deploy resources into"
  type        = string
  default     = "ap-south-1"
}

variable "base_ami_id" {
  description = "The ID of the base AMI for the image builder"
  type        = string
  # Default value is pulled from the data source
  default     = null 
}

variable "ami_name" {
  description = "Name to assign to the Custom AMI at creation"
  type        = string
  # NOTE: To be prompted, this value must be REMOVED from terraform.tfvars.
  # We leave it here for the current setup (using default from .tfvars).
}

variable "webserver_name" {
  description = "The 'Name' tag for the final webserver instance."
  type        = string
  # ERROR FIX: This was previously hardcoded. Making it a variable forces 
  # a prompt, allowing dynamic naming for the final instance.
}
EOF
echo "Created main.tf"

# --- 2. security.tf (Security Group) ---
cat > security.tf << 'EOF'
# security.tf

# ----------------------------------------------------
# Security Group Resource
# ----------------------------------------------------
resource "aws_security_group" "web_sg" {
  name        = "bombay-webserver-sg"
  description = "Allow inbound traffic for web access"

  # Ingress Rules
  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress (All Outbound)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
EOF
echo "Created security.tf"

# --- 3. ec2.tf (Instance and AMI Resources) ---
cat > ec2.tf << 'EOF'
# ec2.tf

# ----------------------------------------------------
# Resource 1: Base Image Builder Instance (COMMENTED OUT FOR COST SAVINGS)
# ----------------------------------------------------
/*
# ERROR FIX: aws_instance.example was causing problems due to insufficient
# instance type (t2.micro) or an older AMI. Switched to 't3.micro' and 
# dynamically referencing the latest stable AMI for stability.
resource "aws_instance" "example" {
  ami           = data.aws_ami.base_os.id
  instance_type = "t3.micro"
  key_name      = "bombay" 

  tags = {
    Name = "Base-Image-Builder"
  }
}
*/

# ----------------------------------------------------
# Resource 2: Custom AMI from Base Instance
# ----------------------------------------------------
resource "aws_ami_from_instance" "custom" {
  # ERROR FIX: Ensure the source instance ID is from the corrected 'example' resource.
  source_instance_id = aws_instance.example.id 
  name               = var.ami_name
  description        = "AMI with my custom setup"
  
  tags = {
    Name = var.ami_name
  }
}

# ----------------------------------------------------
# Resource 3: Final Webserver Instance
# ----------------------------------------------------
resource "aws_instance" "webserver" {
  # AMI is dynamically referenced from the custom AMI resource
  ami             = aws_ami_from_instance.custom.id

  # Instance type fixed for better Free Tier/compatibility
  instance_type   = "t3.micro"

  # Key pair name (assuming 'bombay' exists in the region)
  key_name        = "bombay"

  # ERROR FIX: Security Group reference must use the resource ID.
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    # Instance Name is now a variable, using the dynamic input
    Name        = var.webserver_name
    Environment = "Prod"
    Project     = "CustomAMI"
  }
}
EOF
echo "Created ec2.tf"

# --- 4. storage.tf (New Feature: EBS Volume) ---
cat > storage.tf << 'EOF'
# storage.tf

# ----------------------------------------------------
# New Feature: EBS Volume
# ----------------------------------------------------
resource "aws_ebs_volume" "data_volume" {
  size              = 20 
  type              = "gp2" 
  
  # CRITICAL: Ensures the volume is created in the same AZ as the instance
  availability_zone = aws_instance.webserver.availability_zone 

  tags = {
    Name        = "${var.webserver_name}-DataVolume"
    Environment = "Prod"
  }
}

# ----------------------------------------------------
# New Feature: Attach the Volume
# ----------------------------------------------------
resource "aws_volume_attachment" "ebs_att" {
  volume_id   = aws_ebs_volume.data_volume.id 
  instance_id = aws_instance.webserver.id 
  device_name = "/dev/sdb" 
  force_detach = true 
}
EOF
echo "Created storage.tf"

# --- 5. terraform.tfvars (Variable Values) ---
cat > terraform.tfvars << 'EOF'
# terraform.tfvars

# ERROR FIX: This file name was previously incorrect, causing Terraform
# to not read the variable values.

# The region to deploy to
aws_region = "ap-south-1" 

# The name for the Custom AMI
ami_name = "my-custom-webserver-ami-v1" 

# NOTE: webserver_name is OMITTED here so Terraform prompts the user for it.

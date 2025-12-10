variable "project" {
  description = "Project name tag"
  type        = string
  default     = "60days-devops"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for main VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID (Amazon Linux 2 recommended)"
  type        = string
}

variable "key_name" {
  description = "Name of the existing AWS key pair"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key file used for SSH"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH into the instance"
  type        = string
  default     = "0.0.0.0/0"
}

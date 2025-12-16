variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "iam_username" {
  description = "Name of the IAM user to create"
  type        = string
  default     = "Auser"
}

variable "policy_name" {
  description = "Name of the IAM policy"
  type        = string
  default     = "AuserFullAccessNoDeleteAccount"
}
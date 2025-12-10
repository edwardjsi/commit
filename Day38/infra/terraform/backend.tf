terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket         = "CHANGE-ME-terraform-state-bucket"
    key            = "devops-60days/day38/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "CHANGE-ME-terraform-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket  = "my-terraform-remote-state-bucket"
    key     = "global/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}

terraform {
  backend "s3" {
    bucket  = "my-terraform-remote-state-bucket"
    key     = "day37/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami                         = "ami-0f5ee92e2d63afc18"
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-xxxxxxxx"
  vpc_security_group_ids      = [aws_security_group.web_ssh_http.id]
  associate_public_ip_address = true

  tags = {
    Name = "Day36-EC2"
  }
}

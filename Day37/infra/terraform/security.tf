resource "aws_security_group" "web_ssh_http" {
  name        = "day37-web-ssh-http-sg"
  description = "Allow SSH (22) and HTTP (80) access to EC2 instance"
  vpc_id      = "vpc-xxxxxxxx" # placeholder

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Day37-SG-web-ssh-http"
  }
}

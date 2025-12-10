resource "aws_instance" "docker_host" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.docker_sg.id]
  key_name               = var.key_name
  associate_public_ip_address = true

  tags = {
    Name    = "${var.project}-docker-host"
    Project = var.project
  }

  # Connection details for remote-exec
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"          # For Amazon Linux 2
    private_key = file(var.private_key_path)
  }

  # Remote-exec provisioner to install Docker
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y docker",
      "sudo systemctl enable docker",
      "sudo systemctl start docker",
      "sudo usermod -aG docker ec2-user"
    ]
  }
}

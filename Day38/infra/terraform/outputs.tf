output "docker_host_public_ip" {
  description = "Public IP of the Docker host EC2 instance"
  value       = aws_instance.docker_host.public_ip
}

output "docker_host_public_dns" {
  description = "Public DNS of the Docker host EC2 instance"
  value       = aws_instance.docker_host.public_dns
}

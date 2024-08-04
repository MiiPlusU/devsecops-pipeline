output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.dev_environment.id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.dev_environment.public_ip
}

output "instance_private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.dev_environment.private_ip
}

output "instance_dns_name" {
  description = "The DNS name of the EC2 instance"
  value       = aws_instance.dev_environment.public_dns
}

output "security_group_ids" {
  description = "The security group IDs associated with the instance"
  value       = aws_instance.dev_environment.security_groups
}

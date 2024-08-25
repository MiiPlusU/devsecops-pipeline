output "instance_dns_name" {
  description = "The DNS name of the EC2 instance"
  value       = aws_instance.this.public_dns
}

output "instance_sg_ids" {
  description = "The security group IDs associated with the instance"
  value       = aws_instance.this.security_groups
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.this.id
}

output "instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.this.public_ip
}

output "instance_private_ip" {
  description = "The private IP of the EC2 instance"
  value       = aws_instance.this.private_ip
}

output "instance_profile_name" {
  description = "The name of the IAM instance profile"
  value       = aws_iam_instance_profile.this.name
}

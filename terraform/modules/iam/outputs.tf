output "iam_role_arn" {
  description = "The ARN of the IAM role"
  value       = aws_iam_role.ec2_role.arn
}

output "iam_instance_profile_arn" {
  description = "The ARN of the IAM instance profile"
  value       = aws_iam_instance_profile.ec2_instance_profile.arn
}

output "user_arn" {
  value = aws_iam_user.terraform_user.arn
}

output "ec2_instance_profile_name" {
  value = aws_iam_instance_profile.ec2_instance_profile.name
}

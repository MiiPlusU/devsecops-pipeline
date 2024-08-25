variable "ami_id" {
  description = "The ID of the AMI to launch the instance with"
  type        = string
}

variable "type" {
  description = "The type of the instance to launch"
  type        = string
}

variable "policy_arns" {
  description = "The ARN of the IAM poolicies to associate with the instance profile"
  type        = list(string)
}

variable "tags" {
  description = "Tags to assign to the instance"
  type        = map(string)
}

variable "key_name" {
  description = "Key pair associated with the EC2 instance"
  type = string
}

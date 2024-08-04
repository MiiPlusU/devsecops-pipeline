variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type = string
}

variable "instance_type" {
  description = "The type of the instance"
  type = string
}

variable "tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
}

variable "iam_instance_profile" {
  description = "The IAM instance profile name."
  type        = string
}

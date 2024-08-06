variable "eks_role_arn" {
  description = "The ARN of the IAM role to associate with the EKS cluster"
  type        = string
}
variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs for the EKS cluster"
  type        = list(string)
}

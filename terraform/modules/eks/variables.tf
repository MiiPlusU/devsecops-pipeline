variable "cluster_name" {
  description = "name of cluster"
  type = string
}

variable "cluster_version" {
  description = "version of cluster"
  type = string
}

variable "node_group_min_size" {
  description = "min size of node group"
  type = number
}

variable "node_group_max_size" {
  description = "max size of node group"
  type = number
}

variable "node_group_desired_size" {
  description = "desired size of node group"
  type = number
}

variable "node_group_name" {
  description = "name of Node Group."
  type        = string
}

variable "key_name" {
  description = "key pair associated"
  type        = string
}
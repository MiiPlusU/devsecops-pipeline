resource "aws_eks_cluster" "my_eks_cluster" {
  name = var.cluster_name
  role_arn = var.eks_role_arn
  version = "1.30"

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

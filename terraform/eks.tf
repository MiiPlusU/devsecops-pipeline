module "my_eks_cluster" {
    source = "./modules/eks"
    cluster_name = "my-cluster"
    cluster_version = "1.30"
    node_group_desired_size = 2
    node_group_max_size = 3
    node_group_min_size = 1
    node_group_name = "my-node-group"
    key_name = aws_key_pair.key_pair.key_name
}
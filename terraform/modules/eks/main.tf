resource "aws_eks_cluster" "my_eks_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = var.cluster_version

  vpc_config {
    endpoint_public_access = true
    endpoint_private_access = true  # Allows private access to the EKS API

    subnet_ids = [
      aws_subnet.private_subnet_a.id,
      aws_subnet.private_subnet_b.id
    ]
  }
}

resource "aws_eks_node_group" "my_eks_node_group" {
  cluster_name    = aws_eks_cluster.my_eks_cluster.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids      = [
    aws_subnet.private_subnet_a.id,
    aws_subnet.private_subnet_b.id
  ]

  scaling_config {
    desired_size = var.node_group_desired_size
    max_size     = var.node_group_max_size
    min_size     = var.node_group_min_size
  }

  update_config {
    max_unavailable = 1
  }

  launch_template {
    id      = aws_launch_template.eks_node_template.id
    version = "$Latest"
  }

  labels = {
    role = "general"
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
    aws_eks_cluster.my_eks_cluster
  ]

  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }
}

resource "aws_launch_template" "eks_node_template" {
  name_prefix   = "eks-node-template"
  image_id      = "ami-0248840e1407888c1"
  instance_type = "t3.medium"
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = false  # Change this to false for private subnets
    security_groups             = [aws_security_group.eks_node_sg.id, aws_eks_cluster.my_eks_cluster.vpc_config[0].cluster_security_group_id]
  }

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = 20
      volume_type = "gp3"
    }
  }

  user_data = base64encode(<<-EOF
    MIME-Version: 1.0
    Content-Type: multipart/mixed; boundary="==MYBOUNDARY=="
    --==MYBOUNDARY==
    Content-Type: text/x-shellscript; charset="us-ascii"
    #!/bin/bash
    /etc/eks/bootstrap.sh ${var.cluster_name}  # Use variable for cluster name
    --==MYBOUNDARY==--
  EOF
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "EKS-MANAGED-NODE"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
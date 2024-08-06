provider "aws" {
  region = "us-east-2"
}

module "s3" {
  source = "./modules/s3"
}

module "dynamodb" {
  source = "./modules/dynamodb"
}

module "iam" {
  source    = "./modules/iam"
  user_name = "terraform-user"
  group_name = "admins"
  role_name = "EC2DevSecOpsRole"
}

module "ec2" {
  source        = "./modules/ec2"
  ami_id        = "ami-0a31f06d64a91614b" 
  instance_type = "t2.micro"
  iam_instance_profile = module.iam.ec2_instance_profile_name
  tags          = {
    Name        = "DevEnvironment"
    Environment = "Development"
    Project     = "DevSecOpsPipeline"
    Owner       = "DevTeam"
    Purpose     = "WebServer"
  }
}

module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = "my-eks-cluster"
  eks_role_arn = module.iam.eks_iam_role_arn
  subnet_ids     = [
    module.vpc.public_subnet_a_id,
    module.vpc.public_subnet_b_id,
    module.vpc.private_subnet_a_id,
    module.vpc.private_subnet_b_id
  ]
}

module "my_dev_env" {
  source        = "./modules/ec2"
  ami_id        = "ami-0a31f06d64a91614b" 
  type = "t2.micro"
  policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
  key_name = aws_key_pair.key_pair.key_name
  tags          = {
    Name        = "DevEnvironment"
    Environment = "Development"
    Project     = "DevSecOpsPipeline"
    Owner       = "DevTeam"
    Purpose     = "WebServer"
  }
}
resource "aws_security_group" "dev_env_sg" {
  name        = "dev-env-sg"
  description = "Example security group"
  vpc_id      = "vpc-06d690c0c808f30b0"  # Replace with your VPC ID

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dev-env-sg"
  }
}

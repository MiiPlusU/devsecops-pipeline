resource "aws_subnet" "public_subnet_a" {
  vpc_id = aws_vpc.eks_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "eks-public-subnet-a"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "public_subnet_b" {
    vpc_id = aws_vpc.eks_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-2b"
    map_public_ip_on_launch = true

    tags = {
      Name = "eks-public-subnet-b"
      "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "private_subnet_a" {
  vpc_id = aws_vpc.eks_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-2a"
  
  tags = {
    Name = "eks-private-subnet-a"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id = aws_vpc.eks_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-2b"

  tags = {
    Name = "eks-private-subnet-b"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

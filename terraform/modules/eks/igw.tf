resource "aws_route_table" "public_route" {
    vpc_id = aws_vpc.eks_vpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.eks_igw.id
    }

    tags = {
        Name = "public-route-table"
    }
}

resource "aws_route_table_association" "public_subnet_a_route" {
  subnet_id = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "public_subnet_b_route" {
  subnet_id = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id
}
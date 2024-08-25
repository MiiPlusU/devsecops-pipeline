resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_nat_gateway.id
  }

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "private_subnet_a_route" {
  subnet_id      = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.private_route.id
}

resource "aws_route_table_association" "private_subnet_b_route" {
  subnet_id      = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.private_route.id
}

resource "aws_eip" "eks_nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "eks_nat_gateway" {
  allocation_id = aws_eip.eks_nat_eip.id
  subnet_id     = aws_subnet.public_subnet_a.id  # NAT Gateway should be in a public subnet
}
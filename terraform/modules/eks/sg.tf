resource "aws_security_group" "eks_node_sg" {
    vpc_id = aws_vpc.eks_vpc.id
    name = "eks-node-sg"
    description = "Security group for EKS nodes"

    ingress {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  
    }

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  
    }
    
    ingress {
        from_port   = 10250
        to_port     = 10250
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  
    }

    ingress {
        from_port   = 50000
        to_port     = 50000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "all"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
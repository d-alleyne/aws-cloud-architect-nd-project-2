resource "aws_vpc" "project2_vpc" {
    cidr_block = "10.244.0.0/16"
    enable_dns_hostnames = true
    tags = {
        Name = "Project 2 VPC"
    }  
}

resource "aws_subnet" "project2_public_subnet" {
  vpc_id = aws_vpc.project2_vpc.id
  cidr_block = "10.244.0.0/24"

  tags = {
    "Name" = "Public Subnet"
  }
}

resource "aws_internet_gateway" "project2_vpc_igw" {
  vpc_id = aws_vpc.project2_vpc.id
  tags = {
      Name = "Project 2 - Internet Gateway"
  }
}

resource "aws_route_table" "project2_vpc_public_route" {
    vpc_id = aws_vpc.project2_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.project2_vpc_igw.id
    }

    tags = {
      Name = "Project 2 Public Subnet Route Table"
    }
  
}

resource "aws_route_table_association" "project2_vpc_public_route" {
  subnet_id = aws_subnet.project2_public_subnet.id
  route_table_id = aws_route_table.project2_vpc_public_route.id
}
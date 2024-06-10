resource "aws_route_table" "example" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = {
    Name = "roboshop-${var.ENV}-public-rt"
  }
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.example.id

#   route {
#     cidr_block = var.VPC_CIDR
#     gateway_id = aws_internet_gateway.igw.id
#   }


  tags = {
    Name = "roboshop-${var.ENV}-private-rt"
  }
}
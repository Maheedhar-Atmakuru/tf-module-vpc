resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = {
    Name = "roboshop-${var.ENV}-public-rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = var.VPC_CIDR
#     gateway_id = aws_internet_gateway.igw.id
#   }


  tags = {
    Name = "roboshop-${var.ENV}-private-rt"
  }
}
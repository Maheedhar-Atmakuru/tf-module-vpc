# Creates public subnets
resource "aws_subnet" "public_subnet" {
  count = length(var.PUBLIC_SUBNET_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.PUBLIC_SUBNET_CIDR,count.index)

  tags = {
    Name = "roboshop-${var.ENV}-public-subnet-${count.index}"
  }
}

# Creates private subnets
resource "aws_subnet" "private_subnet" {
  count = length(var.PRIVATE_SUBNET_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.PUBLIC_SUBNET_CIDR,count.index)

  tags = {
    Name = "roboshop-${var.ENV}-private-subnet-${count.index}"
  }
}
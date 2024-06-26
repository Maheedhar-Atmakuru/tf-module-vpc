#Allocates public IP address

resource "aws_eip" "ngw_ip" {
    # instance = aws_instance.web.id
    domain = "vpc"
}

#Provisin Public NAT gateway
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw_ip.id
  subnet_id     = aws_subnet.public_subnet.*.id[0]

  tags = {
    Name = "roboshop-${var.ENV}-ngw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw, aws_eip.ngw_ip]
}
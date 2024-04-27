resource "aws_route_table" "custom_route_table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = var.rt_name
  }
}

resource "aws_route_table_association" "custom_subnet_association" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.custom_route_table.id
}
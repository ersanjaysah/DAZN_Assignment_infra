resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.route_cidr
    gateway_id = var.nat_gateway
  }

  tags = {
    Name = var.pvt_rt_name
  }
}

resource "aws_route_table_association" "pvt_RT_Association" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.private_route_table.id
}
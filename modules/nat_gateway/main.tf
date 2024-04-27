resource "aws_nat_gateway" "custom_NAT_GW" {
  allocation_id     = var.custom_eip
  subnet_id         = var.public_subnet_id
  connectivity_type = "public"

  tags = {
    Name = var.nat_name
  }
}
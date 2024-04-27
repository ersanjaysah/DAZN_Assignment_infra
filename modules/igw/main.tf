
resource "aws_internet_gateway" "custom_IGW" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.my_igw_name
  }
}
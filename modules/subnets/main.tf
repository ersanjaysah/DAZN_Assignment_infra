
resource "aws_subnet" "public_subnet" {
  vpc_id = var.vpc_id
  cidr_block        = var.public_subnets_cidr[0]
  availability_zone = var.public_subnet_AZ[0]

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = var.vpc_id
  cidr_block        = var.private_subnets_cidr[1]
  availability_zone = var.private_subnet_AZ[1]

  tags = {
    Name = "private-subnet"
  }
}

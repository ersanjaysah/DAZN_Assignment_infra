resource "aws_eip" "custom_eip" {
  network_border_group = var.eip_region
  domain               = "vpc"
}
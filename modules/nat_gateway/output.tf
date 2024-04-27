output "nat_gateway" {
  value       = aws_nat_gateway.custom_NAT_GW.id
  description = "it will show nat gateway id"
}

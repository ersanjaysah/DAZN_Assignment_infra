output "custom_eip" {
  value       = aws_eip.custom_eip.id
  description = "this is an elastic ip"
}

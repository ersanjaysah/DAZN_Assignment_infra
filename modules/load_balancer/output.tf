output "lb_id" {
  value       = aws_lb.myLB.id
  description = "load balancers id"
}

output "lb_dns_name" {
    value = aws_lb.myLB.dns_name
}

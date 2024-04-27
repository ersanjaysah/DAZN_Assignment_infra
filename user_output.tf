
output "ecr_output" {
  description = "all output calue of ecr registry"
  value       = module.ecr_module
}

output "vpc_id" {
  description = " This is a custom vpc id"
  value       = module.vpc_module
}

output "igw_id" {
  value       = module.my_custom_igw
  description = "this is output for custom igw"
}

output "public_rt_id" {
  value       = module.public_rt
  description = "this is output for public route table"
}

output "subnet_id" {
  value       = module.my_public_subnet
  description = "this is output for public subnet"
}

output "Mysg_id" {
  value       = module.my_sg
  description = "this is output for sg"
}

output "nat_gtw_output" {
  value       = module.my_nat_gtw
  description = "Nat Gwt id"
}

output "pvt_rtbl" {
  value       = module.private_rt.ptv_RT
  description = "private route table id"
}

output "myec2_id" {
  value       = module.myec2.ec2_instance_id
  description = "ec2 instance id"
}

output "my_eip" {
  value       = module.customeip.custom_eip
  description = " custom eip"
}

output "target_gp_id" {
  value       = module.target_gp.tg_id
  description = "target gp id"
}
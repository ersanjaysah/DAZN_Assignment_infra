# loading ECR registry module
module "ecr_module" {
  source   = "./modules/ecr_registry"
  reponame = "my_ecr_assignment_repo"
  envtag   = "QA"
}

# loading vpc module
module "vpc_module" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  vpc_name   = "custom-vpc"

}

# loading igw module here
module "my_custom_igw" {
  source      = "./modules/igw"
  my_igw_name = "custom-igw"
  vpc_id      = module.vpc_module.vpc_id
}

# Loading subnet module in root
module "my_public_subnet" {
  source               = "./modules/subnets"
  public_subnets_cidr  = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
  public_subnet_AZ     = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
  vpc_id               = module.vpc_module.vpc_id
  private_subnets_cidr = ["10.0.40.0/24", "10.0.50.0/24", "10.0.60.0/24"]
  private_subnet_AZ    = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
}

# Loading public RT in Root
module "public_rt" {
  source           = "./modules/public_RT"
  rt_name          = "pub_route_table"
  vpc_id           = module.vpc_module.vpc_id
  igw_id           = module.my_custom_igw.igw-id
  public_subnet_id = module.my_public_subnet.public_subnet_id
}

# Loading sg in ROOT
module "my_sg" {
  source         = "./modules/security_group"
  sg_name        = "my-sg-name"
  sg_description = "Allow inbound HTTP and HTTPS traffic"
  ports          = [22, 80, 443]
  sg_tag         = "my-sg"
  vpc_id         = module.vpc_module.vpc_id
}

#Loading ec2 in root
module "myec2" {
  source            = "./modules/ec2"
  mysg_id           = module.my_sg.mysg_id
  instance_type_ami = "t3.micro"
  tag_name          = "nginx_ec2"
  public_subnet_id  = module.my_public_subnet.public_subnet_id
  userdata          = file("nginx.sh")
  publickey         = file("./my-key-pair.pub")
}

# Loadinf elastic ip in root form eip module
module "customeip" {
  source     = "./modules/eip"
  eip_region = "eu-north-1"
}

# Loading Nat gateway from nat_gateway module
module "my_nat_gtw" {
  source           = "./modules/nat_gateway"
  custom_eip       = module.customeip.custom_eip
  public_subnet_id = module.my_public_subnet.public_subnet_id
  nat_name         = "nat_gateway"
}

# Loading Private Route table from private_RT module
module "private_rt" {
  source            = "./modules/private_RT"
  vpc_id            = module.vpc_module.vpc_id
  nat_gateway       = module.my_nat_gtw.nat_gateway
  route_cidr        = "0.0.0.0/0"
  pvt_rt_name       = "private_RT"
  private_subnet_id = module.my_public_subnet.private_subnet_id
}

module "target_gp" {
  source                            = "./modules/load_balancer/targetgp"
  tg_name                           = "my-tg"
  target_port                       = 80
  tg_protocol                       = "HTTP"
  vpc_id                            = module.vpc_module.vpc_id
  removing_time_delay               = "100"
  ipaddress_type                    = "ipv4"
  health_check_path                 = "/"
  health_check_interval             = 10
  health_check_timeout              = 7
  health_check_healthy_threshhold   = 3
  health_check_unhealthy_threshhold = 2
  healthy_matcher                   = "200-499"
  ec2_target_instance_id            = module.myec2.ec2_instance_id
  ec2_application_running_port      = 80
  target_type                       = "instance"
}


module "load_balancer" {
  source               = "./modules/load_balancer"
  lb_name              = "myalb"
  internal_type        = false
  lb_type              = "application"
  mysg_id              = [module.my_sg.mysg_id]
  lb_subnets           = [module.my_public_subnet.public_subnet_id, module.my_public_subnet.private_subnet_id]
  lb_delete_protection = false
  tag_name             = "production"
  listner_port         = 80
  listner_protocol     = "HTTP"
  tg_arn               = module.target_gp.tg_id
}

output "lb_dns" {
  value       = module.load_balancer.lb_dns_name
  description = "load balancers dns"
}


resource "aws_lb_target_group" "mytg" {
  name                 = var.tg_name
  port                 = var.target_port
  protocol             = var.tg_protocol 
  vpc_id               = var.vpc_id
  deregistration_delay = var.removing_time_delay 
  ip_address_type      = var.ipaddress_type 
  target_type          = var.target_type 

  health_check {
    path                = var.health_check_path 
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshhold
    unhealthy_threshold = var.health_check_unhealthy_threshhold
    matcher             = var.healthy_matcher
  }
}

resource "aws_lb_target_group_attachment" "ec2_targets" {
  #count            = 0 # Number of EC2 instances to register
  target_group_arn = aws_lb_target_group.mytg.arn
  target_id        = var.ec2_target_instance_id # Use your EC2 instance IDs here
  port             = var.ec2_application_running_port
}
resource "aws_lb" "myLB" {
  name                       = var.lb_name
  internal                   = var.internal_type
  load_balancer_type         = var.lb_type 
  security_groups            = var.mysg_id
  subnets                    = var.lb_subnets 
  enable_deletion_protection = var.lb_delete_protection

  tags = {
    Environment = var.tag_name
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.myLB.arn
  port              = var.listner_port
  protocol          = var.listner_protocol 

  default_action {
    type             = "forward"
    target_group_arn = var.tg_arn
  }
}
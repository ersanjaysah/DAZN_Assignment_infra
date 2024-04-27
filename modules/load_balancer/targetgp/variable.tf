variable "tg_name" {
  description = "tg name"
}

variable "target_port" {
  type        = number
  description = "tg port"
}

variable "tg_protocol" {
  type        = string
  description = "tg protocol"
}

variable "vpc_id"{
  type = string
  description= "vpc id taken from vpc module"
}

variable "removing_time_delay" {
  type        = string
  description = "tg removing time delay"
}

variable "ipaddress_type" {
  type        = string
  description = "tg ip address type ie ipv4"
}

variable "health_check_path" {
  type        = string
  description = "tg health check path"
}

variable "health_check_interval" {
  type        = number
  description = "tg health check interval"
}

variable "health_check_timeout" {
  type        = number
  description = "tg health check timeout"
}

variable "health_check_healthy_threshhold" {
  type        = number
  description = "tg health check healthy threshhold"
}

variable "health_check_unhealthy_threshhold" {
  type        = number
  description = "tg health check unhealthy threshhold"
}

variable "healthy_matcher" {
  type        = string
  description = "tg healthy matcher"
}

variable "ec2_target_instance_id" {
  description = "Instance id going to be mounted"
}

variable "ec2_application_running_port" {
  type        = number
  description = "application running port"
}

variable "target_type" {
  description = "target type"
}



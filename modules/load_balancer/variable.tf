
variable "lb_name" {
    type= string
  description = "lb name"
}

variable "internal_type" {
    type = bool
  description = "tg name"
}

variable "lb_type" {
  description = "lb type"
}

variable "mysg_id"{
    description = "lb sg id"
}

variable "lb_subnets" {
  description = "lb subnets"
}

variable "lb_delete_protection" {
    type= bool
  description = "lb delete protection"
}

variable "tag_name" {
    type= string
  description = "tag name"
}

variable "listner_port" {
    type= number
  description = "lb listener port"
}

variable "listner_protocol" {
    type= string
  description = "lb listner protocol"
}

variable "tg_arn" {
  description = "tg arn will be passed from here"
}



variable "sg_name" {
  type        = string
  default     = "security_gp"
}

variable "sg_description"{
    type = string
    default = "Allow inbound rule HTTP and HTTPS"
}

variable "vpc_id"{
  type = string
}

variable "ports"{
    type = list(number)
}

variable "sg_tag" {
  type        = string
  default     = "QA"
  description = "this is name of sg"
}

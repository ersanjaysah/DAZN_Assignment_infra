variable "vpc_id"{
  type = string
  description = "this is vpc id taken from vpc module"
}

variable "nat_gateway" {
  type        = string
  description = "this is nat gtw id came from nat_gateway module"
}

variable "route_cidr" {
  type        = string
  description = "In pvt rt table route cidr value"
}

variable "pvt_rt_name" {
  type        = string
  description = "default route traffic"
}

variable "private_subnet_id" {
  type        = string
  description = "private subnet id taken from subnet module"
}



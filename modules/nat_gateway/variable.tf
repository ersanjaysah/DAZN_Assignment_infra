variable "custom_eip" {
  type        = string
  description = "eip id taken input from eip module"
}

variable "public_subnet_id" {
  type        = string
  description = " public subnet id taken from subnets module"
}

variable "nat_name" {
  type        = string
  description = " nat gateway name"
}



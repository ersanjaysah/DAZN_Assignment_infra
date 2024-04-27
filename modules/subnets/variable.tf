variable "vpc_id"{
  type = string
}

variable "public_subnets_cidr" {
  default     = ["10.0.1.0/24", "10.0.2.0/24","10.0.3.0/24"]
  description = "public subnet desc.."
}
variable "public_subnet_AZ" {
  default     = ["eu-north-1a","eu-north-1b", "eu-north-1c"]
  description = "stockholm zone"
}

# private subnet
variable "private_subnets_cidr" {
  default     = ["10.0.4.0/24", "10.0.5.0/24","10.0.6.0/24"]
  description = "private subnet desc.."
}

variable "private_subnet_AZ" {
}





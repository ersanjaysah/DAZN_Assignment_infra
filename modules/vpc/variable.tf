variable "cidr_block" {
  default     = "192.168.0.0/16"
  description = "vpc cidr block"
}
variable "vpc_name" {
  type        = string
  default     = "my-custom-vpc"
  description = "custom vpc name"
}



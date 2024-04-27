variable "mysg_id"{
}

variable "instance_type_ami" {
  type        = string
  default     = "t3.medium"
  description = "This is a free tier server"
}

variable "tag_name" {
  type        = string
  default     = "my-ec2"
  description = " ec2 name"
}

variable "public_subnet_id" {
  type        = string
}

variable "userdata" {
  description = "user data for nginx"
}

variable "publickey" {
  description ="public key variable"
}

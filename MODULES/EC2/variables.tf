variable "environment" {}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "public_subnet_1" {
    default = ""
}

variable "ssh_key_name" {
    default = "radostinpaskalev_key"
}

variable "ebs_optimized" {
  description = "must be true or the default is false"
  type        = bool
  default     = false
}

variable "security_group" {
    default = []
}

variable "instance_profile" {
  default = null
}
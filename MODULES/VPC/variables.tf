variable "environment" {
    default = "sbx"
}

variable "vpc_cidr_block" {
  type    = string
}


variable "subnet_cidr_private" {
}

variable "subnet_cidrs_1" {
  default = "10.10.10.0/24"
}

variable "subnet_cidrs_2" {
  default = "10.10.20.0/24"
}

variable "az_subnet_1" {
  default = "us-east-1a"
} 

variable "az_subnet_2" {
  default = "us-east-1b"
}

variable "az_private_subnet" {
  default = "us-east-1c"
}

#############
# SG VARS
############
variable "to_port_def" {
  type    = number
  default = 0
}

variable "from_port_def" {
  type    = number
  default = 0
}

variable "all_protocols" {
  type    = string
  default = "-1"
}

variable "sg_cidrs" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}
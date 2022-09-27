# VPC FILE VARIABLES
#####################
variable "vpc_cidr_block" {
    type = string
    default = "10.10.0.0/16"
}

variable "subnet_cidr_1" {
    default = "10.10.1.0/24"
}

variable "subnet_cidr_2" {
    default = "10.10.3.0/24"
}

variable "subnet_cidr_private" {
    default = "10.10.2.0/24"
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

##########################
#variable for ec2
##########################

variable "ssh_key_name" {
    type = string
    description = "key to use for SSH into the ec2 instance. I will leave it black, sub with your own"
    default = "" 
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "sg_cidrs" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "ebs_optimized" {
    description = "must be true or the default is false"
    type = bool
    default = false
}

variable "tags" {
    type = map
    default = {
        "Purpose" = "2022_DevOps"
    }
}



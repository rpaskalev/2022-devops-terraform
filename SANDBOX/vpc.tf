module "vpc" {
    source = "../MODULES/VPC"
    environment = var.environment

    vpc_cidr_block = "10.10.0.0/16"
    # subnet_cidr_1 = "10.10.10.0/24"
    # subnet_cidr_2 = "10.10.20.0/24"
    subnet_cidr_private = "10.10.30.0/24"
}
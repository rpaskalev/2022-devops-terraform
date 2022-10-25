module "ec2_app_1" {
    source = "../MODULES/EC2"

    environment = var.environment
    security_group = [module.vpc.security_group_id]
    public_subnet_1 = module.vpc.public_subnet_1_id
}

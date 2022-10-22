module "rds" {
    source = "../modules/rds"

    environment = var.environment
    security_group = [module.vpc.security_group_id]
    public_subnet_1 = module.vpc.public_subnet1_id
    
}
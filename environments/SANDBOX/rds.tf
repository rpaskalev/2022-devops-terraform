# module "rds" {
#     source = "../../modules/rds"

#     environment = var.environment
#     security_group = [module.vpc.security_group_id]
#     rds_subnets = [module.vpc.public_subnet_1_id, module.vpc.public_subnet_2_id]
    
# }
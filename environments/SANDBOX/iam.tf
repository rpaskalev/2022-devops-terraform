module "iam" {
    source = "../MODULES/IAM"

    environment = var.environment
    # bucket_arn = module.s3.s3_arn
}


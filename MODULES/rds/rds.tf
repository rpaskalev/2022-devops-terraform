resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = var.db_name
  engine               = var.db_engine #"mysql"
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.db_username
  password             = random_password.password.result
  skip_final_snapshot = true
  db_subnet_group_name = aws_db_subnet_group.default.id
  vpc_security_group_ids = var.security_group #[aws_security_group.allow_tls.id]

}

 resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [var.public_subnet_1,var.public_subnet_1]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$"
}

resource "aws_ssm_parameter" "rds" {
  name  = "/devops2022/database/password"
  type  = "SecureString"
  value = random_password.password.result
  key_id = aws_kms_key.database_key.key_id
}

resource "aws_kms_key" "database_key" {
  description             = "KMS key 1"
  deletion_window_in_days = 7
}

# #####apply existing parametr from AWS############
# data "aws_ssm_parameter" "existing_ssm" {
#   name = "copy_from aws"
# }
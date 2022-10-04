# resource "aws_db_instance" "default" {
#   allocated_storage    = 10
#   db_name              = "mydb"
#   engine               = var.db_engine
#   engine_version       = "10.21"
#   instance_class       = "db.t3.micro"
#   username             = var.db_username
#   password             = data.aws_ssm_parameter.existing_ssm.value   #random_password.rds_password.result
#   skip_final_snapshot  = true
#   db_subnet_group_name = aws_db_subnet_group.default.id
#   vpc_security_group_ids = [aws_security_group.allow_tls.id]
#   kms_key_id = aws_kms_key.database_key.arn
#   storage_encrypted = true
# }

# resource "aws_db_subnet_group" "default" {
#   name       = "main"
#   subnet_ids = [aws_subnet.public_1.id, aws_subnet.public_2.id]

#   tags = {
#     Name = "My DB subnet group"
#   }
# }

# data "aws_ssm_parameter" "existing_ssm" {
#   name = "/ziyotek/existing_parameter/password/test1"
# }

# # resource "random_password" "rds_password" {
# #   length           = 16
# #   special          = true
# #   override_special = "_%@"
# # }

# # resource "aws_ssm_parameter" "rds_parameter" {
# #   name  = "/ziyotek-2022/database/password"
# #   type  = "SecureString"
# #   value = random_password.rds_password.result
# #   key_id = aws_kms_key.database_key.key_id
# # }

# resource "aws_kms_key" "database_key" {
#   description             = "KMS key 1"
#   deletion_window_in_days = 7
# }
# resource "aws_db_instance" "default" {
#   allocated_storage    = 10
#   db_name              = "mydb"
#   engine               = var.db_engine
#   engine_version       = "10.21"
#   instance_class       = "db.t3.micro"
#   username             = var.db_username
#   password             = var.db_password
#   skip_final_snapshot  = true
#   db_subnet_group_name = aws_db_subnet_group.default.id
#   vpc_security_group_ids = [aws_security_group.allow_tls.id]
# }

# resource "aws_db_subnet_group" "default" {
#   name       = "main"
#   subnet_ids = [aws_subnet.public_1.id, aws_subnet.public_2.id]

#   tags = {
#     Name = "My DB subnet group"
#   }
# }
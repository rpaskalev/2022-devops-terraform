# locals {
#   my_bootstrap = file(var.usr_data_file)
# }

# resource "aws_instance" "web" {
#   ami                         = data.aws_ami.example.id #"ami-026b57f3c383c2eec" #only for us-east-1 region
#   instance_type               = var.instance_type
#   subnet_id                   = aws_subnet.public_2.id
#   key_name                    = var.ssh_key_name #aws_key_pair.ec2_key_pair.id  #extremely necessary edit this var with your data
#   ebs_optimized               = var.ebs_optimized
#   user_data                   = local.my_bootstrap
#   vpc_security_group_ids      = [aws_security_group.allow_tls.id]
#   #iam_instance_profile        = aws_iam_instance_profile.test_profile.id
#   associate_public_ip_address = true
#   tags = {
#     Name = "Devops"
#   }

#   lifecycle {
#     ignore_changes = [vpc_security_group_ids]
#     create_before_destroy = true
#     prevent_destroy = false
#   }
# }

# # resource "aws_key_pair" "ec2_key_pair" {
# #   key_name   = "ziyotek-class-key"
# #   public_key = tls_private_key.rsa-4096-example.public_key_openssh
# # }

# # resource "tls_private_key" "rsa-4096-example" {
# #   algorithm = "RSA"

#   # provisioner "local-exec" {
#   #   when = create
#   #   command = "echo '${tls_private_key.rsa-4096-example.private_key_pem}' > ../../Keys/ziyotek-class-key.pem"
#   #   interpreter = [ "bash", "-c" ]
#   # }
# # }

# # resource "local_file" "private_key" {
# #     content  = tls_private_key.rsa-4096-example.private_key_pem
# #     filename = "${var.path}ziyotek-class-key.pem"
# # }

# # variable "path" {
# #   default = "../../Keys/"
# # }



# # Q how do you give ec2 iam permissions, for example to s3 bucket?
# # instance profile


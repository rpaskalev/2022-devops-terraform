resource "aws_instance" "web" {
  ami                    = "ami-026b57f3c383c2eec" #only for us-east-1 region
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_1.id
  key_name               = var.ssh_key_name #extremely necessary edit this var with your data
  ebs_optimized          = var.ebs_optimized
  user_data              = file(var.usr_data_file)
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = "Devops"
  }
}
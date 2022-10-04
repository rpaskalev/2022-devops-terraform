data "aws_ami" "example" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

output "ami" {
  value = data.aws_ami.example.id
}

data "aws_security_group" "selected" {
  id = "sg-04d59649b13a67b5e"
}
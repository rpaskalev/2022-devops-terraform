resource "aws_security_group" "allow_tls" {
  name        = "allow_all_2022"
  description = "Allow ALL inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Inbound traffic"
    from_port   = var.from_port_def
    to_port     = var.to_port_def
    protocol    = var.all_protocols
    cidr_blocks = var.sg_cidrs
  }

  egress {
    description = "Outboud traffic"
    from_port   = var.from_port_def
    to_port     = var.to_port_def
    protocol    = var.all_protocols
    cidr_blocks = var.sg_cidrs
  }

  tags = {
    Name = "allow_all_2022"
  }
}
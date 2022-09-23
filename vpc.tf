resource "aws_vpc" "main" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "2022-DevOps"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id #resource dependancy
  cidr_block        = "10.10.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Private"
  }
}

#-------- SUBNETS -------------------#
resource "aws_subnet" "tf-public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    "Name"      = "tf-public-sub"
    "ManagedBy" = "terraform"
    "Signature" = "Sergio"
  }
}
#------------- GATEWAYS -----------------#
resource "aws_internet_gateway" "tf-igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    "Name"      = "tf-igw"
    "ManagedBy" = "terraform"
    "Signature" = "Sergio"
  }
}
#------------ ROUTE TABLES ---------------#
resource "aws_route_table" "route-public" {
  vpc_id = aws_vpc.main.id

  tags = {
    "Name"      = "tf-route-public"
    "ManagedBy" = "terraform"
    "Signature" = "Sergio"
  }
}
resource "aws_route" "igw-route" {
  route_table_id         = aws_route_table.route-public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.tf-igw.id
}
# RT ASSOCIATIONS
resource "aws_route_table_association" "assign-route-public" {
  route_table_id = aws_route_table.route-public.id
  subnet_id      = aws_subnet.tf-public.id
}
#------------ SECURITY GROUPS ---------------#
resource "aws_security_group" "tf-sg" {
  name        = "tf-sg"
  vpc_id      = aws_vpc.main.id
  description = "SSH, HTTP & HTTPS accessible"

  tags = {
    "Name"      = "allow ssh, http & https"
    "ManagedBy" = "terraform"
    "Signature" = "Sergio"
  }
}
# SG RULES
resource "aws_security_group_rule" "sg-rule-SSH" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tf-sg.id
}
resource "aws_security_group_rule" "sg-rule-HTTP" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tf-sg.id
}
resource "aws_security_group_rule" "sg-rule-HTTPS" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tf-sg.id
}
resource "aws_security_group_rule" "public-out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tf-sg.id
}
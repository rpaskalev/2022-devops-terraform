resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "2022-DevOps"
  }
}

resource "aws_subnet" "public_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_1
  availability_zone = var.az_subnet_1

  tags = {
    Name = "Public"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_2
  availability_zone = var.az_subnet_2

  tags = {
    Name = "Public"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id #resource dependancy
  cidr_block        = var.subnet_cidr_private
  availability_zone = var.az_private_subnet

  tags = {
    Name = "Private"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.example.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.example.id
}

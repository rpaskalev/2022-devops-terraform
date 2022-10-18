resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "public_1" {
  count = length(var.subnet_cidrs) #  =2
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidrs[count.index]
  availability_zone = var.az_subnet[count.index]
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_private
  availability_zone = var.az_private_subnet
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_1[0].id
  route_table_id = aws_route_table.example.id
}

# resource "aws_route_table_association" "b" {
#   subnet_id      = aws_subnet.public_2.id
#   route_table_id = aws_route_table.example.id
# }

output "public_subnet_1_id" {
    value = aws_subnet.public_1.id
}

output "security_group_id" {
  value = aws_security_group.allow_tls.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_2.id
}
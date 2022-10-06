# output "my_ec2_public_ip" {
#   value = aws_instance.web.public_ip
# }

# output "my_ec2_arn" {
#   value = aws_instance.web.arn
# }

output "s3_region" {
  value = aws_s3_bucket.devops_s3_course_2022_moved_resource.region
}

# output "s3_arn" {
#   value = aws_s3_bucket.devops_s3_course_2022_moved_resource.arn
# }
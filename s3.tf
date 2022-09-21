resource "aws_s3_bucket" "devops_s3_course_2022" {
  bucket = "rady-bucket-unique-name"
tags = {
    Name        = "Said bucket"
    Environment = "Dev"
  }
versioning {
    enabled = true
  }
}

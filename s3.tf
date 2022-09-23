resource "aws_s3_bucket" "devops_s3_course_2022" {
  bucket = "rady-bucket-unique-name"
  tags = {
    Name = "Sergio"
    Type = "Shared"
  }
}
resource "aws_s3_bucket_versioning" "bucket-versioning" {
  bucket = aws_s3_bucket.devops_s3_course_2022.id
  versioning_configuration {
    status = "Enabled"
  }
}
<<<<<<< HEAD
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
=======
resource "aws_s3_bucket" "devops_s3_course_2022_moved_resource" {
  bucket = "rady-bucket-unique-name"

  tags = {
    Environment = "devops_2022"
    Name        = "dzmitry-tr-s3"
  }

  versioning {
    enabled = true
  }
>>>>>>> bc8ac09c30585b62abb31beff94b98d030cd35da
}
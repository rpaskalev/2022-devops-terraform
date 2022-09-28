resource "aws_s3_bucket" "devops_s3_course_2022_moved_resource" {
  bucket = var.bucket_name

  versioning {
    enabled = var.versioning
  }

  tags = var.tags
}
resource "aws_s3_bucket" "example" {
  bucket = "ziyotek-vevops-2022-artifact-bucket"
  acl    = "private"

  force_destroy = true
}
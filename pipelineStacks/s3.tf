resource "aws_s3_bucket" "example" {
  bucket = "ziyotek-devops-2022-artifact-S3bucket"
  acl    = "private"

  force_destroy = true
}

#add your state file s3 bucket code here
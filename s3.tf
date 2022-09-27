resource "aws_s3_bucket" "dzmitry_s3" {
  bucket = var.bucket_name #"dzmitry-tf-first-bucket"

  tags = {
    Environment = "devops_2022"
    Name        = "dzmitry-tr-s3"
  }

  versioning {
    enabled = true
  }
  
}
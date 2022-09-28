resource "aws_s3_bucket" "s3_bucket_practice" {
  bucket = "tf-stinkyfeet-bucket"

  tags = {
    Name       = "brittney.kincey"
    department = "developer"
    class      = "devops"
  }

  versioning {
    enabled = true
  }
}

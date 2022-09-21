resource "aws_s3_bucket" "devops_s3_course_2022" {
  bucket = "rady-bucket-unique-name"

 

 versioning {
    enabled = true
  }


tags = {
    Name        = "cem_bucket1"
    Environment = "Dev"
  }

}















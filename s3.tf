resource "aws_s3_bucket" "devops_s3_course_2022" {
  bucket = "saidabbos-bucket-unique-name"

tags = {
  Environment = "Devops"
         Name =  "saidabbos_Devopsclass"
}

versioning {
  enabled = true
}
}

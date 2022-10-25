provider "aws" {
    region = "us-east-1"
    default_tags {
      tags = {
        Name = "ziyotek-devops-${var.environment}"
      }
    }
}

terraform {
  backend "s3" {
    bucket = "rady-bucket-1-0-0-0"
    key    = "dags/myfile"
    region = "us-east-1"
  }
}
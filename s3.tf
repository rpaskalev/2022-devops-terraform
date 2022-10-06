locals {
  prefix = "ziyotek-${var.bucket_name}"
}

resource "aws_s3_bucket" "devops_s3_course_2022_moved_resource" {
  bucket = "${local.prefix}-${var.bucket_name}"

  versioning {
    enabled = var.versioning
  }
  force_destroy = true
}

resource "aws_s3_bucket" "devops_s3_course_2022_moved_resource_1" {
  bucket = "${local.prefix}-${var.bucket_name}-2"

  versioning {
    enabled = var.versioning
  }
  force_destroy = true
}


data "aws_region" "current" {}

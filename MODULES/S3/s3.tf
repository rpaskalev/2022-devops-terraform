locals {
  prefix = "ziyotek-${var.bucket_name}"
}

resource "aws_s3_bucket" "devops_s3_course_2022_moved_resource" {
  bucket = "${var.environment}-${local.prefix}-${data.aws_region.current.id}"

  versioning {
    enabled = var.versioning
  }
  force_destroy = true
}





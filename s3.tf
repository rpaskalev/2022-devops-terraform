resource "aws_s3_bucket" "devops_s3_course_2022_moved_resource" {
  bucket = "${data.aws_region.current.name}-${var.bucket_name}"

  versioning {
    enabled = var.versioning
  }

  tags = var.tags

  # provisioner "local-exec" {
  #   when = destroy
  #   command = "aws s3 rm s3://${self.id} --recursive"
  # }
  force_destroy = true
}

data "aws_region" "current" {}

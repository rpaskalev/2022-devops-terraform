variable "site-name" {
    type = string
    default = "your-unique-website.com"
}
variable "my-name" {
    type = string
    default = "Sergio"
}

resource "aws_s3_bucket" "website-bucket" {
    bucket = var.site-name
    tags = {
        Name = var.my-name
    }
}

resource "aws_s3_bucket_versioning" "web-bucket-v" {
    bucket = aws_s3_bucket.website-bucket.id
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_website_configuration" "website-config" {
    bucket = aws_s3_bucket.website-bucket.id

    index_document {
        suffix = "index.html"
    }
}
resource "aws_s3_bucket_policy" "website-bucket-policy" {
    bucket = aws_s3_bucket.website-bucket.id
    policy = <<EOT
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "${aws_s3_bucket.website-bucket.arn}/*"
        }
    ]
    }
EOT
}
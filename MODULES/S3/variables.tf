variable "bucket_name" {
  description = "Must be unique aws-wide"
  type        = string
  default     = "rady-bucket-ziyotek"
}

variable "environment" {
  default = ""
}

variable "versioning" {
  description = "Cange to TRUE if you vant versioning ON in your S3 bucket"
  type        = bool
  default     = false
}

variable "create_s3" {
  default = false
  type = bool
}
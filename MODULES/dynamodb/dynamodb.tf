resource "aws_dynamodb_table" "backend_s3_lock" {
  name           = "${var.environment}-terraform-lock"
   hash_key       = "LockID"
   read_capacity  = var.read_capacity
   write_capacity = var.write_capacity

   attribute {
     name = "LockID"
     type = "S"
   }
 }
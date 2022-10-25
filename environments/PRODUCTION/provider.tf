provider "aws" {
    region = "us-east-1"
    default_tags {
      tags = {
        Name = "ziyotek-devops-${var.environment}"
      }
    }
}
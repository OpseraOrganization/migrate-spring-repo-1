variable "bucket_name" {
  type        = string
  description = "prefix name"
}

provider "aws" {
  region  = "us-east-2"
}

resource "aws_s3_bucket" "backup-bucket" {
  bucket = "${var.bucket_name}"
  acl    = "private"
  force_destroy = true
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = "~> 1.0"
}

provider "aws" {
  region = "us-east-2"
}

variable "bucket_name" {
  type = string
}

resource "aws_s3_bucket" "bucket_test" {
  bucket        = var.bucket_name
  force_destroy = true
}

output "name_bucket" {
  value = aws_s3_bucket.bucket_test.id
}

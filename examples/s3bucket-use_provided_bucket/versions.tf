terraform {
  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
      version = ">= 1.16.0"
    }
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = "~> 1.0"
}

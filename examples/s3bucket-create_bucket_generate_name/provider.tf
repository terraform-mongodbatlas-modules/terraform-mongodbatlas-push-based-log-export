provider "mongodbatlas" {
  public_key  = var.public_key
  private_key = var.private_key
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_access_key
  region     = var.region
}

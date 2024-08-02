variable "public_key" {
  description = "Public API key to authenticate to Atlas for managing and monitoring your MongoDB deployments"
  type        = string
}

variable "private_key" {
  description = "Private API key to authenticate to Atlas for managing and monitoring your MongoDB deployments"
  type        = string
}

variable "project_id" {
  description = "Atlas project id."
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS private key."
  type        = string
}

variable "aws_access_key" {
  description = "AWS access key."
  type        = string
}

variable "region" {
  description = "AWS region."
  type        = string
}

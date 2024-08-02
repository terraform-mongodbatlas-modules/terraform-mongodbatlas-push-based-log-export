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

variable "project_id" {
  description = "The project id (e.g., 65def6ce0f722a1507105bb5)."
  type        = string
}

variable "bucket_name" {
  description = "Name of the bucket that Atlas will sends the logs to. If you provide no value, a default value of the form {project_id}-atlas-push-log-{timestamp} is assigned (e.g., 66a7ae173df3c34412a71cd6-atlas-push-log-24-7-29-15-0-38)."
  type        = string
  default     = null
  nullable    = true
}

variable "create_bucket" {
  description = "Flag that determines whether the bucket resource has to be created or not."
  type        = bool
  default     = true
}

variable "iam_role_name" {
  description = "Name of the IAM role to use to set up cloud provider access in Atlas. If you provide no value, a default value of the form {project_id}-push-based-log-export-role is assigned (e.g., 66a7ae173df3c34412a71cd6-push-based-log-export-role)."
  type        = string
  default     = null
  nullable    = true
}

variable "iam_role_policy_name" {
  description = "Name of the IAM role policy for the configured aws_iam_role_name. If you provide no value, a default value of the form {project_id}-push-based-log-export-policy is assigned (e.g., 66a7ae173df3c34412a71cd6-push-based-log-export-policy)."
  type        = string
  default     = null
  nullable    = true
}

variable "force_destroy" {
  description = "Boolean that indicates if all objects should be deleted from the bucket when the bucket is destroyed so that it can be destroyed without error."
  type        = bool
  default     = false
}

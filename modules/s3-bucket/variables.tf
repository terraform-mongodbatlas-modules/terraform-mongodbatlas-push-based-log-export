variable "project_id" {
  description = "The project id (e.g., 65def6ce0f722a1507105bb5)."
  type        = string
}

variable "bucket_name" {
  description = "Name of the bucket that Atlas will sends the logs to. If you provide no value, a default value of the form {project_id}-atlas-push-log-{random_string} is assigned (e.g., 66a7ae173df3c34412a71cd6-atlas-push-log-asdfg)."
  type        = string
  default     = null
  nullable    = true
}

variable "use_existing_bucket" {
  description = "Flag that determines whether the module uses an existing bucket or not."
  type        = bool
  default     = false
}

variable "iam_role_name" {
  description = "Name of the IAM role to use to set up cloud provider access in Atlas. If you provide no value, a default value of the form {project_id}-push-based-log-export-role-{random_string} is assigned (e.g., 66a7ae173df3c34412a71cd6-push-based-log-export-role-asdfg)."
  type        = string
  default     = null
  nullable    = true
}

variable "iam_role_policy_name" {
  description = "Name of the IAM role policy for the configured aws_iam_role_name. If you provide no value, a default value of the form {project_id}-push-based-log-export-policy-{random_string} is assigned (e.g., 66a7ae173df3c34412a71cd6-push-based-log-export-policy-asdfg)."
  type        = string
  default     = null
  nullable    = true
}

variable "force_destroy" {
  description = "Boolean that indicates if all objects should be deleted from the bucket when the bucket is destroyed so that it can be destroyed without error."
  type        = bool
  default     = false
}

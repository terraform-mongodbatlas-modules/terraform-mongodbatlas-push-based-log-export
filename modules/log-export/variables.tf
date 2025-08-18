variable "project_id" {
  description = "The project id (e.g., 65def6ce0f722a1507105bb5)."
  type        = string
}

variable "iam_assumed_role_arn" {
  description = "The ARN of the IAM role that Atlas will assume to access the S3 bucket."
  type        = string
}

variable "bucket_name" {
  description = "Name of the bucket that Atlas will send the logs to."
  type        = string
}

variable "prefix_path" {
  description = "S3 prefix path where Atlas will store the logs."
  type        = string
  default     = "push-based-log"
}

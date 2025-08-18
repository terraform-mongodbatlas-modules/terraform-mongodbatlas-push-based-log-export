output "aws_configuration" {
  description = "AWS related ARN role configuration that contains the atlas_assumed_role_external_id and atlas_aws_account_arn. atlas_assumed_role_external_id describes the unique external ID that Atlas uses when it assumes the IAM role in your AWS account. atlas_aws_account_arn describes the ARN associated with the Atlas AWS account used to assume IAM roles in your AWS account."
  value       = mongodbatlas_cloud_provider_access_setup.setup.aws_config
}

output "setup_role_id" {
  description = "Unique identifier of the role that MongoDB Atlas can use to access the collection of resources."
  value       = mongodbatlas_cloud_provider_access_setup.setup.role_id
}

output "auth_role_id" {
  description = "Unique identifier of the role that Atlas can use to access the collection of resources."
  value       = mongodbatlas_cloud_provider_access_authorization.auth.role_id
}

output "push_log_export_id" {
  description = "Unique 24-hexadecimal digit string that identifies the push-based log export configuration."
  value       = mongodbatlas_push_based_log_export.push_log.id
}

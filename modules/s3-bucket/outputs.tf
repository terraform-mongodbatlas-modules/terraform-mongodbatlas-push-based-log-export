# mongodbatlas_cloud_provider_access_setup

output "aws_configuration" {
  description = "AWS related ARN role configuration that contains the atlas_assumed_role_external_id and atlas_aws_account_arn. atlas_assumed_role_external_id describes the unique external ID that Atlas uses when it assumes the IAM role in your AWS account. atlas_aws_account_arn describes the ARN associated with the Atlas AWS account used to assume IAM roles in your AWS account."
  value       = module.log_export.aws_configuration
}

# aws_iam_role

output "role_arn" {
  description = "Amazon Resource Name (ARN) that specifies the role."
  value       = aws_iam_role.iam_role.arn
}

output "unique_id" {
  description = "Stable and unique string that identifies the role."
  value       = aws_iam_role.iam_role.unique_id
}

# aws_iam_role_policy

output "role_policy_id" {
  description = "Role policy ID, in the form of role_name:role_policy_name."
  value       = aws_iam_role_policy.policy.id
}

# aws_s3_bucket (data source)

output "bucket_name" {
  description = "Name of the bucket."
  value       = data.aws_s3_bucket.s3_bucket_data.id
}

output "bucket_arn" {
  description = "ARN of the bucket, in the form of arn:aws:s3:::bucketname."
  value       = data.aws_s3_bucket.s3_bucket_data.arn
}

# Log export outputs

output "log_export_setup_role_id" {
  description = "Unique identifier of the role that MongoDB Atlas can use to access the collection of resources."
  value       = module.log_export.setup_role_id
}

output "log_export_auth_role_id" {
  description = "Unique identifier of the role that Atlas can use to access the collection of resources."
  value       = module.log_export.auth_role_id
}

output "push_log_export_id" {
  description = "Unique 24-hexadecimal digit string that identifies the push-based log export configuration."
  value       = module.log_export.push_log_export_id
}

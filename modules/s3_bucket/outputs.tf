# mongodbatlas_cloud_provider_access_setup

output "aws_configuration" {
  description = "AWS related ARN role configuration that contains the atlas_assumed_role_external_id and atlas_aws_account_arn. atlas_assumed_role_external_id describes the unique external ID that Atlas uses when it assumes the IAM role in your AWS account. atlas_aws_account_arn describes the ARN associated with the Atlas AWS account used to assume IAM roles in your AWS account."
  value       = mongodbatlas_cloud_provider_access_setup.setup.aws_config
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

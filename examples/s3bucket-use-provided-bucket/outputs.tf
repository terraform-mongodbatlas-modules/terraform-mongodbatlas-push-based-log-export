output "aws_config" {
    description = "AWS related ARN role configuration that contains the atlas_assumed_role_external_id and atlas_aws_account_arn. atlas_assumed_role_external_id describes the unique external ID that Atlas uses when it assumes the IAM role in your AWS account. atlas_aws_account_arn describes the ARN associated with the Atlas AWS account used to assume IAM roles in your AWS account."
    value = module.s3.aws_configuration
}

# MongoDB Atlas Push-Based Log Export Module

This module handles the creation of MongoDB Atlas-specific resources required for push-based log export functionality. It configures the cloud provider access setup, authorization, and the push-based log export configuration.

## Resources Created

- `mongodbatlas_cloud_provider_access_setup` - Sets up AWS cloud provider access for Atlas
- `mongodbatlas_cloud_provider_access_authorization` - Authorizes Atlas to assume the provided IAM role
- `mongodbatlas_push_based_log_export` - Configures the push-based log export to the S3 bucket

## Usage

```hcl
module "log_export" {
  source = "./modules/log-export"
  
  project_id            = "your-atlas-project-id"
  iam_assumed_role_arn  = "arn:aws:iam::123456789012:role/atlas-log-export-role"
  bucket_name           = "my-atlas-logs-bucket"
  prefix_path           = "push-based-log"
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 1.0 |
| mongodbatlas | >= 1.16.0 |

## Providers

| Name | Version |
|------|---------|
| mongodbatlas | >= 1.16.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | The project id (e.g., 65def6ce0f722a1507105bb5). | `string` | n/a | yes |
| iam_assumed_role_arn | The ARN of the IAM role that Atlas will assume to access the S3 bucket. | `string` | n/a | yes |
| bucket_name | Name of the bucket that Atlas will send the logs to. | `string` | n/a | yes |
| prefix_path | S3 prefix path where Atlas will store the logs. | `string` | `"push-based-log"` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws_configuration | AWS related ARN role configuration that contains the atlas_assumed_role_external_id and atlas_aws_account_arn. |
| setup_role_id | Unique identifier of the role that MongoDB Atlas can use to access the collection of resources. |
| auth_role_id | Unique identifier of the role that Atlas can use to access the collection of resources. |
| push_log_export_id | Unique 24-hexadecimal digit string that identifies the push-based log export configuration. |

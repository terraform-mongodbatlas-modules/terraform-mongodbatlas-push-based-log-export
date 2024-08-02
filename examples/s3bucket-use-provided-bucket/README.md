# push-based-log-export-s3-bucket - use an existing bucket

This example shows how you can use the s3 bucket submodule to enable push-based logging in an Atlas project. The module will use an existing s3 bucket provided by you.


## Usage

1. Set the following variables: 

- `project_id`: ID of Atlas project
- `public_key`: Atlas public key
- `private_key`: Atlas private key

2. Set the following environment variables:

-  `export AWS_ACCESS_KEY_ID="<YOUR_ACCESS_KEY>"`
-  `export AWS_SECRET_ACCESS_KEY="<YOUR_SECRET_KEY>"`
-  `export AWS_REGION="<YOUR_REGION>"`

3. In the `main.tf` file, set the `create_bucket` variable to `false` and provide an existing s3 bucket name for the `bucket_name` variable.

4. Run the command as in the following example:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Resources

| Name | Type |
|------|------|
| [mongodbatlas_push_based_log_export](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/push_based_log_export) | resource |
| [mongodbatlas_cloud_provider_access_setup](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cloud_provider_access#mongodbatlas_cloud_provider_access_setup) | resource |
| [mongodbatlas_cloud_provider_access_authorization](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cloud_provider_access#mongodbatlas_cloud_provider_access_authorization) | resource |
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket) | data source |

# push-based-log-export-s3-bucket - create a new bucket with a default name

This example shows how you can use the s3 bucket submodule to enable push-based logging in an Atlas project. The module will create a new s3 bucket with a default name.


## Usage

1. Set the following variable: 

- `project_id`: ID of Atlas project

2. Set the following environment variables:

-  `export MONGODB_ATLAS_PUBLIC_KEY="<YOUR_PUBLIC_KEY>"`
-  `export MONGODB_ATLAS_PRIVATE_KEY="<YOUR_PRIVATE_KEY>"`
-  `export AWS_ACCESS_KEY_ID="<YOUR_ACCESS_KEY>"`
-  `export AWS_SECRET_ACCESS_KEY="<YOUR_SECRET_KEY>"`
-  `export AWS_REGION="<YOUR_REGION>"`

3. In the `main.tf` file, set the `create_bucket` variable to `true`.

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
| [aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket) | data source |

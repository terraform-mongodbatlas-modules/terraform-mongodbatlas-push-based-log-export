# S3 Bucket Terraform Submodule

This Terraform submodule configures [push-based log export](https://www.mongodb.com/docs/atlas/push-logs/) to an AWS S3 Bucket in an Atlas project. 

It creates the following resources:

- A MongoDB Atlas Cloud Provider Access Setup.
- An AWS IAM Role.
- An AWS S3 Bucket (if the create_bucket input variable is set to true).
- An AWS IAM Role Policy.
- A MongoDB Atlas Cloud Provider Access Authorization.
- Enables Push-Based Log Export in an Atlas project.

You can find detailed information of the submodule's input and output variables in the [Terraform Public Registry](https://registry.terraform.io/modules/terraform-mongodbatlas-modules/push-based-log-export/mongodbatlas/latest/submodules/s3-bucket)

## Usage 

```terraform
module "s3" {
  source  = "terraform-mongodbatlas-modules/push-based-log-export/mongodbatlas//modules/s3-bucket"
  version = "1.0.0"
  project_id = "66a26b4c85718b1be4ff37cb"
  bucket_name = "my-bucket"
  create_bucket = true
  iam_role_name = "push-log-role"
  iam_role_policy_name = "push-log-policy"
  force_destroy = false
}
```

The [examples](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-push-based-log-export/tree/main/examples) folder contains detailed examples that show how to use this submodule.

- [s3bucket-create-bucket-generate-name](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-push-based-log-export/tree/main/examples/s3bucket-create-bucket-generate-name) shows how you can use the s3 bucket submodule to enable push-based logging in an Atlas project. The module will create a new s3 bucket with a default name.
- [s3bucket-create-bucket-provided-name](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-push-based-log-export/tree/main/examples/s3bucket-create-bucket-provided-name) shows how you can use the s3 bucket submodule to enable push-based logging in an Atlas project. The module will create a new s3 bucket with the name specified.
- [s3bucket-use-provided-bucket](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-push-based-log-export/tree/main/examples/s3bucket-use-provided-bucket) shows how you can use the s3 bucket submodule to enable push-based logging in an Atlas project. The module will use an existing s3 bucket provided by you.

## Resources

| Name | Type |
|------|------|
| [mongodbatlas_push_based_log_export](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/push_based_log_export) | resource |
| [mongodbatlas_cloud_provider_access_setup](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cloud_provider_access#mongodbatlas_cloud_provider_access_setup) | resource |
| [mongodbatlas_cloud_provider_access_authorization](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cloud_provider_access#mongodbatlas_cloud_provider_access_authorization) | resource |
| [aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket) | data source | resource |

Refer to the [MongoDB Atlas](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs) and [AWS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) Terraform providers documentations if you want more information.

## Considerations

When you set the input variable `force_destroy` to true, if you remove the module, the AWS S3 Bucket will also be destroyed together with the rest of the resources, even if it has content and files inside.


## License

See [LICENSE](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-push-based-log-export/blob/main/LICENSE) for full details.

# Push Based Log Export Terraform Module

This Terraform module configures push-based log export in an Atlas project. Consists of the following submodule:

- [s3 bucket](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-push-based-log-export/tree/main/modules/s3_bucket)

## Requirements

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.0
- [terraform-provider-mongodbatlas](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs) >= 1.16.0
- [terraform-provider-aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) 
- [MongoDB Atlas](https://www.mongodb.com/products/platform/atlas-database) account
- [AWS](https://aws.amazon.com/account/) account

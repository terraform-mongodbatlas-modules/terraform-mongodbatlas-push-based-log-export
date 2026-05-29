# Push Based Log Export Terraform Module

> **Archived:** This repository is no longer maintained. Use the [project](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-project) and [cluster](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-cluster) modules from the [terraform-mongodbatlas-modules](https://github.com/terraform-mongodbatlas-modules/) organization instead. For up-to-date Terraform examples and reference implementations, see [atlas-examples](https://github.com/terraform-mongodbatlas-modules/atlas-examples).

This Terraform module configures push-based log export in an Atlas project and consists of the following submodule:

- [s3 bucket](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-push-based-log-export/tree/main/modules/s3-bucket)

## Requirements

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.0
- [terraform-provider-mongodbatlas](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs) >= 1.16.0
- [terraform-provider-aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) 
- [MongoDB Atlas](https://www.mongodb.com/products/platform/atlas-database) account
- [AWS](https://aws.amazon.com/account/) account

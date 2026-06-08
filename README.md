# Push Based Log Export Terraform Module

> **Archived:** This repository is no longer maintained. Use the [MongoDB Atlas AWS module](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-atlas-aws) from the [terraform-mongodbatlas-modules](https://github.com/terraform-mongodbatlas-modules/) organization instead. For up-to-date Terraform examples and reference implementations, see [atlas-examples](https://github.com/terraform-mongodbatlas-modules/atlas-examples).

## Migration

Replace your module source:

```hcl
# Before
module "s3" {
  source  = "terraform-mongodbatlas-modules/push-based-log-export/mongodbatlas//modules/s3-bucket"
  version = "1.0.0"
  project_id = var.project_id
  # ...
}

# After
module "atlas_aws" {
  source  = "terraform-mongodbatlas-modules/atlas-aws/mongodbatlas"
  project_id = var.project_id

  log_integration = {
    enabled = true
    create_s3_bucket = {
      enabled       = true
      name_prefix   = var.bucket_name_prefix
      force_destroy = var.force_destroy
    }
    integrations = [
      { log_types = ["MONGOD"], prefix_path = "operational" },
      { log_types = ["MONGOD_AUDIT"], prefix_path = "audit" },
    ]
  }
}
```

For module-managed buckets with an exact name or an existing S3 bucket, see the [log_integration example](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-atlas-aws/tree/main/examples/log_integration) and the [atlas-aws examples](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-atlas-aws/tree/main/examples).

## Links

- [atlas-aws on Terraform Registry](https://registry.terraform.io/modules/terraform-mongodbatlas-modules/atlas-aws/mongodbatlas/latest)
- [atlas-aws on GitHub](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-atlas-aws)
- [log_integration example](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-atlas-aws/tree/main/examples/log_integration)

# Old Docs

This Terraform module configures push-based log export in an Atlas project and consists of the following submodule:

- [s3 bucket](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-push-based-log-export/tree/main/modules/s3-bucket)

## Requirements

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.0
- [terraform-provider-mongodbatlas](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs) >= 1.16.0
- [terraform-provider-aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) 
- [MongoDB Atlas](https://www.mongodb.com/products/platform/atlas-database) account
- [AWS](https://aws.amazon.com/account/) account

resource "random_string" "this" {
  length  = 5
  special = false
  numeric = false
  upper   = false
}

locals {
  random_suffix            = random_string.this.result
  bucket_name_def          = var.bucket_name == null ? "${var.project_id}-atlas-push-log-${local.random_suffix}" : var.bucket_name
  iam_role_name_def        = var.iam_role_name == null ? "${var.project_id}-push-based-log-export-role-${local.random_suffix}" : var.iam_role_name
  iam_role_policy_name_def = var.iam_role_policy_name == null ? "${var.project_id}-push-based-log-export-policy" : var.iam_role_policy_name
}

resource "aws_s3_bucket" "s3_bucket" {
  count         = var.use_existing_bucket ? 0 : 1
  bucket        = local.bucket_name_def
  force_destroy = var.force_destroy
}

data "aws_s3_bucket" "s3_bucket_data" {
  bucket = var.use_existing_bucket ? local.bucket_name_def : aws_s3_bucket.s3_bucket[0].id
}

resource "aws_iam_role" "iam_role" {
  name                 = local.iam_role_name_def
  max_session_duration = 43200 # PBLE requires a max role duration of 12 hours
  assume_role_policy   = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
            "Effect": "Allow",
            "Principal": {
                "AWS": "${mongodbatlas_cloud_provider_access_setup.setup.aws_config[0].atlas_aws_account_arn}"
            },
            "Action": "sts:AssumeRole",
            "Condition": {
                "StringEquals": {
                "sts:ExternalId": "${mongodbatlas_cloud_provider_access_setup.setup.aws_config[0].atlas_assumed_role_external_id}"
                }
            }
            }
        ]
    }
    EOF
}

resource "aws_iam_role_policy" "policy" {
  name = local.iam_role_policy_name_def
  role = aws_iam_role.iam_role.id

  policy = <<-EOF
    {
        "Version": "2012-10-17",
        "Statement": [
        {
            "Effect": "Allow",
            "Action": [
            "s3:ListBucket",
            "s3:PutObject",
            "s3:GetObject",
            "s3:GetBucketLocation"
            ],
            "Resource": [
            "${data.aws_s3_bucket.s3_bucket_data.arn}",
            "${data.aws_s3_bucket.s3_bucket_data.arn}/*"
            ]
        }
        ]
    }
    EOF
}

resource "mongodbatlas_cloud_provider_access_setup" "setup" {
  project_id    = var.project_id
  provider_name = "AWS"
}

resource "mongodbatlas_cloud_provider_access_authorization" "auth" {
  project_id = var.project_id
  role_id    = mongodbatlas_cloud_provider_access_setup.setup.role_id

  aws {
    iam_assumed_role_arn = aws_iam_role.iam_role.arn
  }
}

resource "mongodbatlas_push_based_log_export" "push_log" {
  project_id  = var.project_id
  bucket_name = local.bucket_name_def
  iam_role_id = mongodbatlas_cloud_provider_access_authorization.auth.role_id
  prefix_path = "push-based-log"
}

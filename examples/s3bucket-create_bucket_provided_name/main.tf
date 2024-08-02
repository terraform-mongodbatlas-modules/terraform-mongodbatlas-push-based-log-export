module "s3" {
  source               = "../../modules/s3_bucket"
  project_id           = var.project_id
  create_bucket        = true
  bucket_name          = "new-push-based-log-export-bucket"
  iam_role_name        = "new-push-based-log-export-role-name"
  iam_role_policy_name = "new-push-based-log-export-policy-name"
  force_destroy = false
}

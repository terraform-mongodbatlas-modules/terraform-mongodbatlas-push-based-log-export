module "s3" {
  source               = "terraform-mongodbatlas-modules/push-based-log-export/mongodbatlas//modules/s3-bucket"
  project_id           = var.project_id
  use_existing_bucket  = false
  bucket_name          = "new-push-based-log-export-bucket"
  iam_role_name        = "new-push-based-log-export-role-name"
  iam_role_policy_name = "new-push-based-log-export-policy-name"
  force_destroy        = false
}

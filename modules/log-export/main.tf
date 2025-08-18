resource "mongodbatlas_cloud_provider_access_setup" "setup" {
  project_id    = var.project_id
  provider_name = "AWS"
}

resource "mongodbatlas_cloud_provider_access_authorization" "auth" {
  project_id = var.project_id
  role_id    = mongodbatlas_cloud_provider_access_setup.setup.role_id

  aws {
    iam_assumed_role_arn = var.iam_assumed_role_arn
  }
}

resource "mongodbatlas_push_based_log_export" "push_log" {
  project_id  = var.project_id
  bucket_name = var.bucket_name
  iam_role_id = mongodbatlas_cloud_provider_access_authorization.auth.role_id
  prefix_path = var.prefix_path
}

module "s3" {
  source        = "terraform-mongodbatlas-modules/push-based-log-export/mongodbatlas//modules/s3-bucket"
  project_id    = var.project_id
  create_bucket = true
  force_destroy = false
}

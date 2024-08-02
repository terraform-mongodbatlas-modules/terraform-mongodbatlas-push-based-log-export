module "s3" {
  source        = "../../modules/s3_bucket"
  project_id    = var.project_id
  create_bucket = true
  force_destroy = false
}

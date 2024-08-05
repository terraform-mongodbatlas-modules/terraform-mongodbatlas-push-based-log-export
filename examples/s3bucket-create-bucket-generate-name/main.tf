module "s3" {
  source        = "../../modules/s3-bucket"
  project_id    = var.project_id
  create_bucket = true
  force_destroy = false
}

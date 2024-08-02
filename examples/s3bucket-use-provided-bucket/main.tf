module "s3" {
  source        = "../../modules/s3_bucket"
  project_id    = var.project_id
  create_bucket = false
  bucket_name   = "my-push-based-log-export-bucket" # assuming an s3 bucket with this name already exists
}

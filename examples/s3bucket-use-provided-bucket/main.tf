module "s3" {
  source        = "terraform-mongodbatlas-modules/push-based-log-export/mongodbatlas//modules/s3-bucket"
  project_id    = var.project_id
  use_existing_bucket = true
  bucket_name   = "my-push-based-log-export-bucket" # assuming an s3 bucket with this name already exists
}

output "bucket_arn" {
  description = "ARN of the bucket, in the form of arn:aws:s3:::bucketname."
  value       = module.s3.bucket_arn
}

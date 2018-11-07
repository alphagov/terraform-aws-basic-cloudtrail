# Import the bucket into Terraform management, just in case it's not been created locally.
data "aws_s3_bucket" "cloudtrail_bucket" {
  depends_on = ["aws_s3_bucket.cloudtrail_bucket"]
  bucket     = "${local.bucket_name}"
}

module "cloudwatch_example" {
  source = "git::https://github.com/alphagov/terraform-aws-basic-cloudtrail.git"

  enable_logging = "true"

  s3_key_prefix   = "${var.product}-${var.environment}"
  resource_prefix = "${var.product}-${var.environment}"

  # Set the bucket name if you want to use a bucket that already exists.
  # bucket_name = "[your S3 bucket with the correct policy attached]"

  custom_tags = {
    environment = "${var.environment}"
    product     = "${var.product}"
  }
}

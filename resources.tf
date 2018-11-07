resource "aws_cloudtrail" "cloudtrail" {
  name                          = "${local.cloudtrail_name}"
  s3_bucket_name                = "${data.aws_s3_bucket.cloudtrail_bucket.id}"
  s3_key_prefix                 = "${var.s3_key_prefix}"
  enable_logging                = "${var.enable_logging}"
  include_global_service_events = false

  tags = "${merge("${var.custom_tags}", map("ManagedBy", "Terraform"))}"
}

resource "aws_s3_bucket" "cloudtrail_bucket" {
  bucket        = "${local.bucket_name}"
  count         = "${local.create_bucket ? 1 : 0}"
  force_destroy = false
  acl           = "${var.predefined_acl}"

  versioning {
    enabled = true
  }

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::${local.bucket_name}"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${local.bucket_name}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY

  tags = "${merge("${var.custom_tags}", map("ManagedBy", "Terraform"))}"
}

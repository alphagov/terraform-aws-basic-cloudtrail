variable "aws_profile" {
  description = "AWS profile"
  type        = "string"
}

variable "aws_region" {
  description = "AWS region"
  type        = "string"
}

variable "environment" {
  description = "Environment name (e.g. production, test, ci). This is used to construct the S3 key name into which the Cloudtrail output is saved"
  type        = "string"
}

variable "product" {
  description = "Name of the product whose infrastructure is being monitered. This is used to construct the S3 key name into which the Cloudtrail output is saved"
  type        = "string"
}

variable "predefined_acl" {
  description = "(Optional) A pre-defined or canned acl to apply to the bucket. This determines who is able to view the contents of the S3 bucket. For more information on values this field can take, see https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl"
  type        = "string"
  default     = "private"
}

variable "custom_tags" {
  description = "(Optional) List of custom tags to apply to the resource"
  type        = "map"
  default     = {}
}

variable "bucket_name" {
  description = "Name of an S3 bucket that already exists. This bucket will be used to log Cloudtrail events. If no bucket name is specified then one will be created"
  type        = "string"
  default     = ""
}

variable "enable_logging" {
  description = "(Optional) Whether or not to enable logging for the trail. Defaults to true. Setting this to false will pause logging"
  type        = "string"
  default     = "true"
}

variable "resource_prefix" {
  description = "(Optional) Prefix used when naming the AWS Cloudtrail resource and, if not specified in the bucket_name variable, the S3 bucket used to store the Cloudtrail logs. Specifying this variable is recommended to prevent duplicate AWS resource names"
  type        = "string"
  default     = ""
}

variable "s3_key_prefix" {
  description = "Specifies the S3 key prefix that precedes the name of the bucket you have designated for log file delivery"
  type        = "string"
}

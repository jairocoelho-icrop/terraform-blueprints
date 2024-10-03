# Required

variable "app" {
  description = "The name of the app"
  type        = string
}

variable "env" {
  description = "The environment to use"
  type        = string
}

variable "origin" {
  description = "The origin to use in the CloudFront distribution"
  type        = any
}

variable "default_cache_behavior" {
  description = "The default cache behavior to use in the CloudFront distribution"
  type        = any
}

variable "domain_name" {
  description = "The domain name to use"
  type        = string
}

# Optional

variable "subdomain" {
  description = "The subdomain to use"
  type        = string
  default     = ""
}

variable "region" {
  description = "The AWS region to use"
  type        = string
  default     = "us-east-1"
}

variable "ordered_cache_behavior" {
  description = "The ordered cache behavior to use in the CloudFront distribution"
  type        = list(any)
  default     = []
}

variable "create_origin_access_identity" {
  description = "Whether to create an origin access identity"
  type        = bool
  default     = false
}

variable "s3_bucket_arn" {
  description = "The ARN of the S3 bucket to use"
  type        = string
  default     = ""
}

variable "s3_bucket_id" {
  description = "The ID of the S3 bucket to use"
  type        = string
  default     = ""
}

variable "origin_access_identities" {
  description = "The origin access identities to use"
  type        = map(string)
  default     = {}
}

variable "custom_error_response" {
  description = "One or more custom error response elements"
  type        = any
  default     = {}
}

variable "acm_certificate_arn" {
  description = "The ARN of the ACM certificate"
  type        = string
  default     = null
}

variable "tags" {
  description = "Additional tags to use"
  type        = map(string)
  default     = {}
}

variable "create_s3_bucket_policy" {
  description = "Whether to create the S3 bucket policy"
  type        = bool
  default     = true
}

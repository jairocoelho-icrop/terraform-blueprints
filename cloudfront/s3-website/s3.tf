# Origin Access Identities
data "aws_iam_policy_document" "s3_policy" {
  count = var.s3_bucket_arn != "" ? 1 : 0
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${var.s3_bucket_arn}/*"]

    principals {
      type        = "AWS"
      identifiers = module.cloudfront.cloudfront_origin_access_identity_iam_arns
    }
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  count  = var.create_s3_bucket_policy && var.s3_bucket_id != "" ? 1 : 0
  bucket = var.s3_bucket_id
  policy = data.aws_iam_policy_document.s3_policy[0].json
}
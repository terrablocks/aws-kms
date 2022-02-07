data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "default" {
  statement {
    sid       = "Allow IAM access"
    effect    = "Allow"
    actions   = ["kms:*"]
    resources = ["*"]
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type        = "AWS"
    }
  }
}

resource "aws_kms_key" "this" {
  is_enabled               = var.is_enabled
  description              = var.description
  key_usage                = var.key_usage
  customer_master_key_spec = var.cmk_spec
  policy                   = var.policy == "" ? data.aws_iam_policy_document.default.json : var.policy
  deletion_window_in_days  = var.deletion_window
  enable_key_rotation      = var.enable_key_rotation
  multi_region             = var.multi_region
  tags                     = var.tags
}

resource "aws_kms_alias" "this" {
  name          = "alias/${var.alias}"
  target_key_id = aws_kms_key.this.key_id
}

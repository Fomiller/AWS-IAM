data "aws_iam_policy_document" "terraform_role" {
  statement {
    sid    = "STSassumeRole"
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${var.account_id_dev}:role/${local.terraform_role}"
      ]
    }
  }
}


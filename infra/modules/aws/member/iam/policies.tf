data "aws_iam_policy_document" "terraform_role" {
  provider = aws.member

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
        aws_iam_user.terraform_user.arn
      ]
    }
  }
}


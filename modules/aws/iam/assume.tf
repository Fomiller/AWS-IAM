data "aws_iam_policy_document" "lambda_assume_policy" {
  statement {
    sid     = "STSassumeRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "aws_terraform_assume_policy" {
  statement {
    sid     = "STSassumeRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [data.aws_iam_user.aws_terraform.arn]
    }
  }
}

data "aws_iam_policy_document" "lambda_assume_policy" {
    statement {
    sid = "STSassumeRole"
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

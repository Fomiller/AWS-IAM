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

data "aws_iam_policy_document" "cross_account_route53" {
  provider = aws.member

  statement {
    sid    = "CrossAccountRout53"
    effect = "Allow"
    actions = [
      "route53:GetHostedZone"
    ]
    resources = [
      var.fomillercloud_subdomain_public_arn
    ]
  }
}

resource "aws_iam_policy" "cross_account_route53" {
  name   = "CrossAccountRoute53Access"
  policy = data.aws_iam_policy_document.cross_account_route53.json
}

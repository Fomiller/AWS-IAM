resource "aws_iam_user" "terraform_user" {
  provider = aws.member
  name     = local.terraform_user
  path     = "/"
}

resource "aws_iam_user_policy_attachment" "terraform_role" {
  user       = data.aws_iam_user.admin.name
  policy_arn = aws_iam_policy.cross_account_route53.arn
}

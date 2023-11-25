resource "aws_iam_user" "terraform_user" {
  name = "AWSTerraformORG"
  path = "/"
}

resource "aws_iam_user_policy" "terraform_user" {
  name   = "test"
  user   = aws_iam_user.terraform_user.name
  policy = data.aws_iam_policy.admin_access
}

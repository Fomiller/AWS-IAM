resource "aws_iam_user" "terraform_user" {
  provider = aws.member
  name     = local.terraform_user
  path     = "/"
}

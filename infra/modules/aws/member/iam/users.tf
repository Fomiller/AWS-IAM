resource "aws_iam_user" "terraform_user" {
  name = local.terraform_user
  path = "/"
}

resource "aws_iam_role" "terraform_role" {
  name                 = local.terraform_role
  assume_role_policy   = data.aws_iam_policy_document.terraform_role.json
  max_session_duration = 43200
}

resource "aws_iam_role_policy_attachment" "terraform_role" {
  role       = aws_iam_role.terraform_role.name
  policy_arn = data.aws_iam_policy.admin_access.arn
}


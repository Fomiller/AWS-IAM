resource "aws_iam_role" "aws_terraform" {
  name                 = "AWSTERRAFORM"
  assume_role_policy   = data.aws_iam_policy_document.aws_terraform_assume_policy.json
  max_session_duration = 43200
}

resource "aws_iam_role_policy_attachment" "aws_terraform" {
  role       = aws_iam_role.aws_terraform.name
  policy_arn = data.aws_iam_policy.admin_access.arn
}

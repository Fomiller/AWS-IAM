resource "aws_iam_group" "cross_account_access" {
  name = "CrossAccountAccess"
}
resource "aws_iam_group_membership" "cross_account_access" {
  name = "cross-account-access-membership"
  users = [
    aws_iam_user.terraform_user.name,
  ]
  group = aws_iam_group.cross_account_access.name
}

resource "aws_iam_group" "admin_access" {
  name = "AdministratorAccess"
}

resource "aws_iam_group_membership" "admin_access" {
  name = "admin-access-membership"
  users = [
    aws_iam_user.terraform_user.name,
  ]
  group = aws_iam_group.admin_access.name
}

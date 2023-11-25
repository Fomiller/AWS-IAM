data "aws_iam_policy_document" "terraform_role" {
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
        "arn:aws:iam::${var.account_id_dev}:role/${local.terraform_role}"
      ]
    }
  }
}

data "aws_iam_policy_document" "cross_account_access" {
  statement {
    sid     = "OrganizationCrossAccount"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    resources = [
      "arn:aws:iam::${var.account_id_dev}:role/OrganizationAccountAccessRole",
      "arn:aws:iam::${var.account_id_prod}:role/OrganizationAccountAccessRole"
    ]
  }
}

resource "aws_iam_policy" "cross_account_access" {
  name   = "GrantAccessToOrganizationAccountAccessRole"
  policy = data.aws_iam_policy_document.cross_account_access.json
}

resource "aws_iam_group_policy_attachment" "cross_account_access" {
  group      = aws_iam_group.cross_account_access
  policy_arn = aws_iam_policy.cross_account_access.arn
}

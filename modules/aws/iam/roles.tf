resource "aws_iam_role" "test_role" {
  name               = "testRole"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "test_policy" {
    role = aws_iam_role.test_role.name
    policy_arn = aws_iam_policy.test_policy.arn
}


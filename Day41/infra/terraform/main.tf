provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

resource "aws_iam_user" "auser" {
  name = var.iam_username
}

resource "aws_iam_policy" "auser_full_access_no_delete_account" {
  name        = var.policy_name
  description = "Full privileges except deleting the AWS account"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": "organizations:DeleteAccount",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "auser_attach" {
  user       = aws_iam_user.auser.name
  policy_arn = aws_iam_policy.auser_full_access_no_delete_account.arn
}

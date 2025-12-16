output "iam_user_name" {
  description = "The IAM user created"
  value       = aws_iam_user.auser.name
}

output "iam_user_arn" {
  description = "The ARN of the IAM user"
  value       = aws_iam_user.auser.arn
}

output "policy_arn" {
  description = "The ARN of the attached IAM policy"
  value       = aws_iam_policy.auser_full_access_no_delete_account.arn
}

output "iam_random_number" {
  description = "Random number received in IAM module"
  value       = var.random_number
}

output "iam_group_name" {
  description = "IAM Group Name"
  value       = aws_iam_group.matei_neaga_iam_group.name
}

output "iam_role_name" {
  description = "IAM Role Name"
  value       = aws_iam_role.matei_neaga_iam_role.name
}

output "iam_policy_name" {
  description = "IAM Policy Name"
  value       = aws_iam_policy.matei_neaga_iam_policy.name
}

output "iam_instance_profile_arn" {
  description = "IAM Instance profile ARN"
  value       = aws_iam_instance_profile.matei_neaga_iam_profile.arn
}
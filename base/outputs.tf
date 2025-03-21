output "vpc_id_from_base" {
  description = "VPC Id"
  value       = module.network.vpc_id
}

output "random_number" {
  value = random_string.my_numbers.result
}

output "StudentName" {
  value = var.StudentName
}

output "StudentSurname" {
  value = var.StudentSurname
}

output "region" {
  value = var.region
}

# output "public_subnet_ids_from_base" {
#   value = module.network.public_subnet_ids
# }

# output "security_group_id_ssh_from_base" {
#   description = "SSH SG-id"
#   value       = module.network_security.security_group_id_ssh
# }

# output "security_group_id_http_from_base" {
#   description = "HTTP-to-LB SG-id"
#   value       = module.network_security.security_group_id_http
# }

# output "security_group_id_http_lb_from_base" {
#   description = "HTTP-from-LB SG-id"
#   value       = module.network_security.security_group_id_http_lb
# }

# output "iam_random_number" {
#   description = "Random number received in IAM module"
#   value       = module.iam.iam_random_number
# }

# output "iam_group_name" {
#   description = "IAM Group Name"
#   value       = module.iam.iam_group_name
# }

# output "iam_role_name" {
#   description = "IAM Role Name"
#   value       = module.iam.iam_role_name
# }

# output "iam_policy_name" {
#   description = "IAM Policy Name"
#   value       = module.iam.iam_policy_name
# }

output "security_group_id_ssh" {
  description = "SSH SG-id"
  value       = aws_security_group.ssh.id
}

output "security_group_id_http" {
  description = "HTTP-to-LB SG-id"
  value       = aws_security_group.http-to-lb.id
}

output "security_group_id_http_lb" {
  description = "HTTP-from-LB SG-id"
  value       = aws_security_group.http-from-lb.id
}


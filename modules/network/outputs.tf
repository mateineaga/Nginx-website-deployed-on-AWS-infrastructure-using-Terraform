output "vpc_id" {
  description = "VPC Id"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = [for s in aws_subnet.my_subnets : s.id]
}

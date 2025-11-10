output "public_subnet_id" {
  description = "Public subnet ID"
  value       = aws_subnet.public_subnet.id
}

output "public_sg_id" {
  description = "Public security group ID"
  value       = aws_security_group.public_sg.id
}
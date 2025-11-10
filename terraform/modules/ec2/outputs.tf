output "public_ec2_ip" {
  value       = aws_instance.public_ec2.public_ip
  description = "Public IP of EC2 instance"
}

output "public_ec2_dns" {
  value       = aws_instance.public_ec2.public_dns
  description = "Public DNS of EC2 instance"
}
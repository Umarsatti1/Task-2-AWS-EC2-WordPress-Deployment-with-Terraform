output "ec2_instance_public_ip" {
  value       = module.ec2.public_ec2_ip
  description = "Public IP Address of EC2 instance"
}

output "ec2_instance_public_dns" {
  value       = module.ec2.public_ec2_dns
  description = "Public DNS of EC2 instance"
}
resource "aws_instance" "public_ec2" {
  ami                         = var.ec2_ami_id
  instance_type               = var.ec2_instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.public_sg_id]
  associate_public_ip_address = true
  key_name                    = "webapp"

  user_data = file("${path.root}/userdata.sh")

  tags = {
    Name = "Wordpress-EC2"
  }
}
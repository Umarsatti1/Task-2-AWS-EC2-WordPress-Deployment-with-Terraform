variable "vpc_name" {
    default = "umar-vpc"
    description = "VPC name"
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
    description = "VPC CIDR Block"
}

variable "ec2_ami_id" {
    default = "ami-0ecb62995f68bb549"
    description = "Public EC2 AMI ID"
}

variable "ec2_instance_type" {
    default = "t3.micro"
    description = "Public EC2 instance type"
}
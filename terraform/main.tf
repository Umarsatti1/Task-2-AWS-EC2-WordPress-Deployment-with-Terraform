module "vpc" {
  source   = "./modules/vpc"
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
}

module "ec2" {
  source            = "./modules/ec2"
  ec2_ami_id        = var.ec2_ami_id
  ec2_instance_type = var.ec2_instance_type
  public_subnet_id  = module.vpc.public_subnet_id
  public_sg_id      = module.vpc.public_sg_id
}
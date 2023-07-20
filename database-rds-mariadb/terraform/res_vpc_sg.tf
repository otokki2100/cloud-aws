module "security_group_ec2" {
  source = "terraform-aws-modules/security-group/aws"

  name   = "security-group-ec2"
  vpc_id = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "${var.myip}/32"
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

module "security_group_rds" {
  source = "terraform-aws-modules/security-group/aws"

  name   = "security-group-rds"
  vpc_id = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "-1"
      cidr_blocks = "${module.ec2.private_ip}/32"
    }
  ]
}

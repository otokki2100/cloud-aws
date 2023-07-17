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
    },
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "${module.vpc.vpc_cidr_block}"
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

module "security_group_alb" {
  source = "terraform-aws-modules/security-group/aws"

  name   = "security-group-alb"
  vpc_id = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "TCP"
      cidr_blocks = "${var.myip}/32"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "TCP"
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

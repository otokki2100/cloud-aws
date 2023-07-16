module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.2"

  name   = "security-group"
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

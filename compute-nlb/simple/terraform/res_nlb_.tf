module "nlb" {
  source  = "terraform-aws-modules/alb/aws"

  name               = "nlb"
  load_balancer_type = "network"
  vpc_id             = module.vpc.vpc_id
  subnets            = [module.vpc.public_subnets[0], module.vpc.public_subnets[1], module.vpc.public_subnets[2]]
  enable_deletion_protection = false

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "TCP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        target = {
          target_id = module.ec2.id
          port = 80
        }
      }
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "TLS"
      certificate_arn    = module.acm.acm_certificate_arn
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "TCP"
      target_group_index = 0
    }
  ]

  tags = {
    Name = "nlb"
  }
}

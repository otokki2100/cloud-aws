module "alb" {
  source = "terraform-aws-modules/alb/aws"

  name                       = "alb"
  load_balancer_type         = "application"
  vpc_id                     = module.vpc.vpc_id
  subnets                    = [module.vpc.public_subnets[0], module.vpc.public_subnets[1], module.vpc.public_subnets[2]]
  security_groups            = [module.security_group_alb.security_group_id]
  enable_deletion_protection = false

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      health_check = {
        enabled             = true
        interval            = 10
        path                = "/"
        port                = "traffic-port"
        healthy_threshold   = 2
        unhealthy_threshold = 2
        timeout             = 5
        protocol            = "HTTP"
        matcher             = "200"
      }
      targets = {
        target = {
          target_id = module.ec2.id
          port      = 80
        }
      }
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = module.acm.acm_certificate_arn
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Name = "alb"
  }
}

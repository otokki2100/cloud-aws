data "aws_route53_zone" "domain" {
  name         = var.domain
  private_zone = false
}

resource "aws_route53_record" "domain_record" {
  zone_id = data.aws_route53_zone.domain.zone_id
  name    = local.domain
  type    = "CNAME"
  ttl     = 60
  records = [module.alb.lb_dns_name]
  allow_overwrite = true
}

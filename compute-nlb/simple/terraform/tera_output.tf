output "vm_id" {
  value = module.ec2.id
}

output "vm_ip" {
  value = module.ec2.public_ip
}

output "lb_dns_name" {
  value = module.nlb.lb_dns_name
}

output "domain" {
  value = local.domain
}

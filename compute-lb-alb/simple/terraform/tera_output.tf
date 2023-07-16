output "vm_id" {
  value = module.ec2.id
}

output "vm_ip" {
  value = module.ec2.public_ip
}

output "lb_dns_name" {
  value = module.alb.lb_dns_name
}

output "domain" {
  value = local.domain
}

output "vm_z_ssh" {
  value = "ssh ${var.ec2.user}@${module.ec2.public_ip} -o StrictHostKeyChecking=no -i id_rsa"
}

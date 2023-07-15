output "vm_id" {
  value = module.ec2.id
}

output "vm_user" {
  value = var.ec2.user
}

output "vm_ip" {
  value = module.ec2.public_ip
}

output "vm_1_id" {
  value = module.ec2_1.id
}

output "vm_2_id" {
  value = module.ec2_2.id
}

output "vm_1_ip" {
  value = module.ec2_1.public_ip
}

output "vm_2_ip" {
  value = module.ec2_2.public_ip
}

output "vm_1_user" {
  value = var.ec2_1.user
}

output "vm_2_user" {
  value = var.ec2_2.user
}

output "vm_1_z_ssh" {
  value = "ssh ${var.ec2_1.user}@${module.ec2_1.public_ip} -o StrictHostKeyChecking=no -i id_rsa"
}

output "vm_2_z_ssh" {
  value = "ssh ${var.ec2_2.user}@${module.ec2_2.public_ip} -o StrictHostKeyChecking=no -i id_rsa"
}

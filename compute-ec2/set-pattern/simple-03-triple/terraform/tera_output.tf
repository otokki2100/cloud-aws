output "vm_1_info_id" {
  value = module.ec2_1.id
}

output "vm_1_info_instance_type" {
  value = var.ec2_1.instance_type
}

output "vm_1_ssh_1_user" {
  value = var.ec2_1.user
}

output "vm_1_ssh_2_ip" {
  value = module.ec2_1.public_ip
}

output "vm_1_ssh_3_ssh" {
  value = "ssh ${var.ec2_1.user}@${module.ec2_1.public_ip} -o StrictHostKeyChecking=no -i id_rsa"
}

output "vm_2_info_id" {
  value = module.ec2_2.id
}

output "vm_2_info_instance_type" {
  value = var.ec2_2.instance_type
}

output "vm_2_ssh_1_user" {
  value = var.ec2_2.user
}

output "vm_2_ssh_2_ip" {
  value = module.ec2_2.public_ip
}

output "vm_2_ssh_3_ssh" {
  value = "ssh ${var.ec2_2.user}@${module.ec2_2.public_ip} -o StrictHostKeyChecking=no -i id_rsa"
}

output "vm_3_info_id" {
  value = module.ec2_3.id
}

output "vm_3_info_instance_type" {
  value = var.ec2_3.instance_type
}

output "vm_3_ssh_1_user" {
  value = var.ec2_3.user
}

output "vm_3_ssh_2_ip" {
  value = module.ec2_3.public_ip
}

output "vm_3_ssh_3_ssh" {
  value = "ssh ${var.ec2_3.user}@${module.ec2_3.public_ip} -o StrictHostKeyChecking=no -i id_rsa"
}

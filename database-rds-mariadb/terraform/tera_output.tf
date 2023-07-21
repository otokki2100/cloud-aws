output "vm_id" {
  value = module.ec2.id
}

output "vm_ip" {
  value = module.ec2.public_ip
}

output "db_address" {
  value = module.db.db_instance_address
}

output "vm_z_ssh" {
  value = "ssh ${var.ec2.user}@${module.ec2.public_ip} -o StrictHostKeyChecking=no -i id_rsa"
}

output "vm_z_ssh_tunnel" {
  value = "ssh -L 127.0.0.1:13306:${module.db.db_instance_address}:3306 ${var.ec2.user}@${module.ec2.public_ip} -o StrictHostKeyChecking=no -i id_rsa"
}

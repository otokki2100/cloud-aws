output "vm_proxy_1_frontend_info_id" {
  value = module.proxy_frontend.id
}

output "vm_proxy_1_frontend_info_instance_type" {
  value = var.proxy_frontend.instance_type
}

output "vm_proxy_1_frontend_ssh_1_user" {
  value = var.proxy_frontend.user
}

output "vm_proxy_1_frontend_ssh_2_ip" {
  value = module.proxy_frontend.public_ip
}

output "vm_proxy_1_frontend_ssh_3_ssh" {
  value = "ssh ${var.proxy_frontend.user}@${module.proxy_frontend.public_ip} -o StrictHostKeyChecking=no -i id_rsa"
}

output "vm_proxy_2_backend_info_id" {
  value = module.proxy_backend.id
}

output "vm_proxy_2_backend_info_instance_type" {
  value = var.proxy_backend.instance_type
}

output "vm_proxy_2_backend_ssh_1_user" {
  value = var.proxy_backend.user
}

output "vm_proxy_2_backend_ssh_2_ip" {
  value = module.proxy_backend.private_ip
}

output "vm_proxy_2_backend_ssh_3_ssh" {
  value = "ssh ${var.proxy_backend.user}@${module.proxy_backend.private_ip} -o StrictHostKeyChecking=no"
}

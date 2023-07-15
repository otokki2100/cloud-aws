output "vm_proxy_frontend_id" {
  value = module.proxy_frontend.id
}

output "vm_proxy_backend_id" {
  value = module.proxy_backend.id
}

output "vm_proxy_frontend_ip" {
  value = module.proxy_frontend.public_ip
}

output "vm_proxy_backend_ip" {
  value = module.proxy_backend.public_ip
}

output "vm_proxy_frontend_user" {
  value = var.proxy_frontend.user
}

output "vm_proxy_backend_user" {
  value = var.proxy_backend.user
}

output "vm_proxy_frontend_z_ssh" {
  value = "ssh ${var.proxy_frontend.user}@${module.proxy_frontend.public_ip} -o StrictHostKeyChecking=no -i id_rsa"
}

output "vm_proxy_backend_z_ssh" {
  value = "ssh ${var.proxy_backend.user}@${module.proxy_backend.public_ip} -o StrictHostKeyChecking=no -i id_rsa"
}

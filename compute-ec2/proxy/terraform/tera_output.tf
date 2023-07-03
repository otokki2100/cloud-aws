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
  value = module.proxy_backend.private_ip
}

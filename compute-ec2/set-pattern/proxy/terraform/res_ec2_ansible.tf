resource "local_file" "ansible_inventory" {
  filename        = "./hosts"
  file_permission = "0600"
  content  = <<-EOT
all:
  hosts:
    proxy-frontend:
      ansible_host: ${module.proxy_frontend.public_ip}
      ansible_connection: ssh
      ansible_user: ${var.proxy_frontend.user}
      ansible_ssh_private_key_file: id_rsa
      ansible_ssh_common_args: "-o StrictHostKeyChecking=no"

    proxy-backend:
      ansible_host: ${module.proxy_backend.private_ip}
      ansible_connection: ssh
      ansible_user: ${var.proxy_backend.user}
      ansible_ssh_private_key_file: id_rsa
      ansible_ssh_common_args:
        -o StrictHostKeyChecking=no
        -o ProxyCommand="ssh -W %h:%p -q -i id_rsa ${var.proxy_frontend.user}@${module.proxy_frontend.public_ip}"
  EOT
}

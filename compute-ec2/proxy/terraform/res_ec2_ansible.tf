resource "local_file" "ansible_inventory" {
  filename        = "./hosts"
  file_permission = "0600"
  content  = <<-EOT
all:
  hosts:
    proxy_frontend:
      ansible_host: ${module.proxy_frontend.public_ip}
      ansible_connection: ssh
      ansible_user: ${var.proxy_frontend.user}
      ansible_ssh_private_key_file: id_rsa
      ansible_ssh_common_args: "-o StrictHostKeyChecking=no"

    proxy_backend:
      ansible_host: ${module.proxy_backend.public_ip}
      ansible_connection: ssh
      ansible_user: ${var.proxy_backend.user}
      ansible_ssh_private_key_file: id_rsa
      ansible_ssh_common_args: "-o StrictHostKeyChecking=no"
  EOT
}

resource "local_file" "ansible_cfg" {
  filename        = "./ansible.cfg"
  file_permission = "0600"
  content  = <<-EOT
[ssh_connection]
ssh_args = -o ProxyCommand='ssh -q -W %h:%p -i id_rsa ${var.proxy_backend.user}@${module.proxy_backend.public_ip}'
  EOT
}

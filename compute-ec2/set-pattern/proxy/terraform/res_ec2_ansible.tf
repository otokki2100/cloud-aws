resource "local_file" "ansible_inventory" {
  filename        = "./hosts"
  file_permission = "0600"
  content         = <<-EOT
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

resource "local_file" "ansible_variables" {
  filename        = "ansible_variables.yml"
  file_permission = "0600"
  content         = <<-EOT
region: ${var.region}
myip: ${var.myip}
wiki_code_path_remote_1: ${var.wiki_code_path_remote_1}
wiki_code_path_remote_2: ${var.wiki_code_path_remote_2}

instance_type_1: ${var.proxy_frontend.instance_type}
ami_1: ${var.proxy_frontend.ami}
user_1: ${var.proxy_frontend.user}
dist_1: ${var.proxy_frontend.dist}
domain_1: ${var.proxy_frontend.domain}

instance_type_2: ${var.proxy_backend.instance_type}
ami_2: ${var.proxy_backend.ami}
user_2: ${var.proxy_backend.user}
dist_2: ${var.proxy_backend.dist}
domain_2: ${var.proxy_backend.domain}
  EOT
}

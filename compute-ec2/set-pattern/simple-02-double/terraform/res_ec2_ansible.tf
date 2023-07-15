resource "local_file" "ansible_inventory" {
  filename        = "./hosts"
  file_permission = "0600"
  content  = <<-EOT
all:
  hosts:
    ec2-1:
      ansible_host: ${module.ec2_1.public_ip}
      ansible_connection: ssh
      ansible_user: ${var.ec2_1.user}
      ansible_ssh_private_key_file: id_rsa
      ansible_ssh_common_args: "-o StrictHostKeyChecking=no"

    ec2-2:
      ansible_host: ${module.ec2_2.public_ip}
      ansible_connection: ssh
      ansible_user: ${var.ec2_2.user}
      ansible_ssh_private_key_file: id_rsa
      ansible_ssh_common_args: "-o StrictHostKeyChecking=no"
  EOT
}

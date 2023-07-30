resource "local_file" "ansible_inventory" {
  filename        = "./hosts"
  file_permission = "0600"
  content         = <<-EOT
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

resource "local_file" "ansible_variables" {
  filename        = "ansible_variables.yml"
  file_permission = "0600"
  content         = <<-EOT
region: ${var.region}
myip: ${var.myip}

instance_type: ${var.ec2_1.instance_type}
ami: ${var.ec2_1.ami}
user: ${var.ec2_1.user}
dist: ${var.ec2_1.dist}
domain: ${var.ec2_1.domain}

instance_type: ${var.ec2_2.instance_type}
ami: ${var.ec2_2.ami}
user: ${var.ec2_2.user}
dist: ${var.ec2_2.dist}
domain: ${var.ec2_2.domain}
  EOT
}

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

    ec2-3:
      ansible_host: ${module.ec2_3.public_ip}
      ansible_connection: ssh
      ansible_user: ${var.ec2_3.user}
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
wiki_code_path_remote_1: ${var.wiki_code_path_remote_1}
wiki_code_path_remote_2: ${var.wiki_code_path_remote_2}
wiki_code_path_remote_3: ${var.wiki_code_path_remote_3}

instance_type_1: ${var.ec2_1.instance_type}
ami_1: ${var.ec2_1.ami}
user_1: ${var.ec2_1.user}
dist_1: ${var.ec2_1.dist}
domain_1: ${var.ec2_1.domain}

instance_type_2: ${var.ec2_2.instance_type}
ami_2: ${var.ec2_2.ami}
user_2: ${var.ec2_2.user}
dist_2: ${var.ec2_2.dist}
domain_2: ${var.ec2_2.domain}

instance_type_3: ${var.ec2_3.instance_type}
ami_3: ${var.ec2_3.ami}
user_3: ${var.ec2_3.user}
dist_3: ${var.ec2_3.dist}
domain_3: ${var.ec2_3.domain}
  EOT
}

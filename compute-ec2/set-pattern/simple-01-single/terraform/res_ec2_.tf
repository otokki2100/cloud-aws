module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name                        = "ec2"
  instance_type               = var.ec2.instance_type
  ami                         = var.ec2.ami
  key_name                    = "rsa-keypair-${timestamp()}"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.security-group.security_group_id]
  associate_public_ip_address = true
  user_data = <<-EOF
    #!/bin/bash
    curl -L http://example.com/my-script.sh -o userdata.sh
    bash userdata.sh
  EOF

user_data = templatefile("${var.wiki_code}/lang-code/shell/init/init-${var.ec2.dist}.sh.tpl", {
    user   = var.ec2.user,
    dist   = var.ec2.dist,
    domain = var.ec2.domain,
  })
  
  root_block_device = [{
    volume_size           = "100"
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }]

  tags = {
    Name = "ec2"
  }
}

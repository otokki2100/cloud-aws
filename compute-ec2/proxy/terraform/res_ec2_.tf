module "proxy_frontend" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name                        = "proxy_frontend"
  instance_type               = var.proxy_frontend.instance_type
  ami                         = var.proxy_frontend.ami
  key_name                    = "rsa-keypair-${timestamp()}"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.sg_proxy_frontend.security_group_id]
  associate_public_ip_address = true
  private_ip                  = "10.0.101.11"

  user_data                   = templatefile(data.http.script.response_body, {
    domain                    = var.ec2.domain,
  })

  root_block_device = [{
    volume_size = "100"
    volume_type = "gp3"
    encrypted             = true
    delete_on_termination = true    
  }]

  tags = {
    Name = "proxy_frontend"
  }
}

module "proxy_backend" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name                        = "proxy_backend"
  instance_type               = var.proxy_backend.instance_type
  ami                         = var.proxy_backend.ami
  key_name                    = "rsa-keypair-${timestamp()}"
  subnet_id                   = module.vpc.private_subnets[0]
  vpc_security_group_ids      = [module.sg_proxy_backend.security_group_id]
  associate_public_ip_address = false
  private_ip                  = "10.0.1.11"

  user_data                   = file(var.proxy_backend.user_data)

  root_block_device = [{
    volume_size = "100"
    volume_type = "gp3"
    encrypted             = true
    delete_on_termination = true    
  }]

  tags = {
    Name = "proxy_backend"
  }
}

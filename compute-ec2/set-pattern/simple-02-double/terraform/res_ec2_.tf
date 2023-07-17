module "ec2_1" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                        = "ec2-1"
  instance_type               = var.ec2_1.instance_type
  ami                         = var.ec2_1.ami
  key_name                    = "rsa-keypair-${timestamp()}"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.security-group.security_group_id]
  associate_public_ip_address = true

  user_data = templatefile(var.ec2_1.script, {
    domain = var.ec2_1.domain,
    user   = var.ec2_1.user,
  })

  root_block_device = [{
    volume_size           = "100"
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }]

  tags = {
    Name = "ec2-1"
  }
}

module "ec2_2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                        = "ec2-2"
  instance_type               = var.ec2_2.instance_type
  ami                         = var.ec2_2.ami
  key_name                    = "rsa-keypair-${timestamp()}"
  subnet_id                   = module.vpc.public_subnets[1]
  vpc_security_group_ids      = [module.security-group.security_group_id]
  associate_public_ip_address = true

  user_data = templatefile(var.ec2_2.script, {
    domain = var.ec2_2.domain,
    user   = var.ec2_2.user,
  })

  root_block_device = [{
    volume_size           = "100"
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }]

  tags = {
    Name = "ec2-2"
  }
}

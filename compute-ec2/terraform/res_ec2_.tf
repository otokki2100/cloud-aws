module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.0.0"

  name                        = "ec2"
  instance_type               = var.ec2.instance_type
  ami                         = var.ec2.ami
  key_name                    = "rsa-keypair-${timestamp()}"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.security-group.security_group_id]
  associate_public_ip_address = true
  # private_ip                  = "10.0.101.11"
  user_data                   = templatefile(var.ec2.user_data, {

  })

  root_block_device = [{
    volume_size = "100"
    volume_type = "gp3"
    encrypted             = true
    delete_on_termination = true    
  }]

  tags = {
    Name = "ec2"
  }
}

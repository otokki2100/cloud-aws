variable "aws_access_key" {
  description = "AWS access key"
}

variable "aws_secret_key" {
  description = "AWS secret key"
}

variable "myip" {
  description = "My IP"
}

variable "domain" {
  description = "Domain"
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "ec2" {
  type = object({
    user           = string
    instance_type  = string
    ami            = string
  })
}

locals {
  current_date = formatdate("YYMMDDHHmm", timestamp())
  domain = "alb-${local.current_date}.${var.domain}"
}

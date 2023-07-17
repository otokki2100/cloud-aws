variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "myip" {
  description = "My IP"
}

variable "domain" {
  description = "Domain"
}

variable "ec2" {
  type = object({
    user          = string
    instance_type = string
    ami           = string
  })
}

variable "nlb" {
  type = object({
    enable_cross_zone = bool
  })
}

locals {
  current_date = formatdate("YYMMDDHHmm", timestamp())
  domain       = "nlb-${local.current_date}.${var.domain}"
}

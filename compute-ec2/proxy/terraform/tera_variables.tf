variable "aws_access_key" {
  description = "AWS access key"
}

variable "aws_secret_key" {
  description = "AWS secret key"
}

variable "myip" {
  description = "My IP"
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "proxy_frontend" {
  type = object({
    user           = string
    instance_type  = string
    ami            = string
    script         = string
  })
}

variable "proxy_backend" {
  type = object({
    user           = string
    instance_type  = string
    ami            = string
    script         = string
  })
}

variable "domain" {
  description = "Domain"
}

locals {
  current_date = formatdate("YYMMDDHHmm", timestamp())
  domain = "gitlab-${local.current_date}.${var.domain}"
}

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

variable "zone_id" {
  description = "Zone id"
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
    user_data      = string
  })
}

variable "nlb" {
  type = object({
    enable_cross_zone = bool
  })
}

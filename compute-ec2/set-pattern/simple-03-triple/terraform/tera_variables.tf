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

variable "ec2_1" {
  type = object({
    user           = string
    instance_type  = string
    ami            = string
    domain         = string
    script         = string
  })
}

variable "ec2_2" {
  type = object({
    user           = string
    instance_type  = string
    ami            = string
    domain         = string
    script         = string
  })
}

variable "ec2_3" {
  type = object({
    user           = string
    instance_type  = string
    ami            = string
    domain         = string
    script         = string
  })
}

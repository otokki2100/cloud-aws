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
    domain         = string    
    script         = string
  })
}

variable "proxy_backend" {
  type = object({
    user           = string
    instance_type  = string
    ami            = string
    domain         = string    
    script         = string
  })
}

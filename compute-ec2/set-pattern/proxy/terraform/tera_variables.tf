variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "myip" {
  description = "My IP"
}

variable "proxy_frontend" {
  type = object({
    user          = string
    instance_type = string
    ami           = string
    domain        = string
    script        = string
  })
}

variable "proxy_backend" {
  type = object({
    user          = string
    instance_type = string
    ami           = string
    domain        = string
    script        = string
  })
}

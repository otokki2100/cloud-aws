variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "myip" {
  description = "My IP"
}

variable "ec2" {
  type = object({
    instance_type = string
    ami           = string    
    user          = string
    dist          = string
    domain        = string
    code          = string
  })
}

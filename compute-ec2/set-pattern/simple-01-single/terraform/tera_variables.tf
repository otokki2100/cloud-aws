variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "myip" {
  description = "My IP"
}

variable "ec2" {
  type = object({
    user          = string
    instance_type = string
    ami           = string
    domain        = string
    script        = string
  })
}

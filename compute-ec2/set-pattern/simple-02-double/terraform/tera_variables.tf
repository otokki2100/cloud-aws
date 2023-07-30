variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "myip" {
  description = "My IP"
}

variable "wiki_code_path" {
  description = "Wiki Code Path"
}

variable "ec2_1" {
  type = object({
    instance_type = string
    ami           = string
    user          = string
    dist          = string
    domain        = string
  })
}

variable "ec2_2" {
  type = object({
    instance_type = string
    ami           = string
    user          = string
    dist          = string
    domain        = string
  })
}

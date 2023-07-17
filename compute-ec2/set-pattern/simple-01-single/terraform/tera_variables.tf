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

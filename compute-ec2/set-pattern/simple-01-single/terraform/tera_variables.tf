variable "myip" {
  description = "My IP"
}

variable "wiki_code_path" {
  description = "Wiki Code Path"
}

variable "ec2" {
  type = object({
    instance_type = string
    ami           = string    
    user          = string
    dist          = string
    domain        = string
  })

  default = {
    instance_type = "t3.micro"
    ami           = "ami-022e1a32d3f742bd8"
    user          = "ec2-user"
    dist          = "amazl-23"
    domain        = "amazl-23"
  }
}

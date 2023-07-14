data "http" "script" {
  url = "https://raw.githubusercontent.com/otokki2100/lang-code/main/${var.ec2.script}"
}

resource "local_file" "script" {
  filename        = var.ec2.script
  content         = data.http.script.response_body
}

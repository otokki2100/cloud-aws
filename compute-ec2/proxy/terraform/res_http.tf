data "http" "script_1" {
  url = "https://raw.githubusercontent.com/otokki2100/lang-code/main/${var.proxy_frontend.script}"
}

data "http" "script_2" {
  url = "https://raw.githubusercontent.com/otokki2100/lang-code/main/${var.proxy_backend.script}"
}

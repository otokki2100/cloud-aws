provider "archive" {}

resource "archive_file" "example" {
  source = "https://example.com/remote_file.txt"
  destination = "script/script.sh"
}

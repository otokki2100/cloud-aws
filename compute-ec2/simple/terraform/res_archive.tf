resource "archive_file" "script" {
  source = "https://example.com/remote_file.txt"
  destination = "script/script.sh"
}

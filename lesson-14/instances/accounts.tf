
resource "aws_iam_user" "accounts" {
  depends_on = [ aws_instance.web_server_1, aws_instance.web_server_2 ]
  for_each = toset(var.accounts)
  name = each.key

  tags = {
    Time-Created = formatdate("MM DD YYYY hh:mm ZZZ", timestamp())
    Department = "Techie-Nerds"     
  }
}

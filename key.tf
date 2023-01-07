resource "aws_key_pair" "devops-key-1" {
  key_name   = "devops-key"
  public_key = file(var.pub_key)
}
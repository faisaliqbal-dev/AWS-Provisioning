resource "aws_key_pair" "Application-Key-pair" {
  key_name   = "Application-Key-pair"
  public_key = file("${path.module}"/id_rsa.pub)
  
}
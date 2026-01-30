variable "cidr" {
  default = "0.0.0.0/0"
}
data "aws_subnet" "default" {
  default_for_az = true
}

variable "cidr" {
  default = "0.0.0.0/0"
}

variable "subnet_id" {
  description = "Subnet ID for EC2 instance"
  type        = string
  default = "subnet-0c6f4ffb4fedd704b"
}

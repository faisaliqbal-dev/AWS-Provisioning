resource "aws_security_group" "Application_Sec_Grp" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0ff774c27e04d046a"

  tags = {
    Name = "Application-Sec-Grp"
  }
}

resource "aws_vpc_security_group_ingress_rule" "Allow_SSH" {
  security_group_id = aws_security_group.Application_Sec_Grp.id
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  cidr_ipv4        = var.cidr
}


resource "aws_vpc_security_group_ingress_rule" "Allow_nginx" {
  security_group_id = aws_security_group.Application_Sec_Grp.id
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  cidr_ipv4      = var.cidr
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.Application_Sec_Grp.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
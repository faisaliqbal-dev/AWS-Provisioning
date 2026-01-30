resource "aws_instance" "Application-Instance" {
    ami = "ami-02774d409be696d81"
    instance_type = "t3.micro"
    key_name = aws_key_pair.Application-Key-pair.key_name
    vpc_security_group_ids = [aws_security_group.Application_Sec_Grp.id]
    subnet_id = data.aws_subnet.default.id
    count = 1

    user_data = <<-EOF
        #!/bin/bash
        sudo apt update -y 
        sudo apt install docker.io -y
        sudo systemctl start docker
        sudo systemctl enable docker
        sudo usermod -aG docker ubuntu

  EOF

  tags = {
    name = "Application-Server"
  }
  
}
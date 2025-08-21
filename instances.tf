resource "aws_instance" "web1" {
  ami           = "ami-044415bb13eee2391" # Ubuntu 22.04 in ap-south-1 (change if needed)
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_subnet_1.id
  key_name      = "sejal_terraform"

  vpc_security_group_ids = [aws_security_group.sejal_ec2_sg.id]   # ✅ updated

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y apache2
              echo "Hello from Web1" > /var/www/html/index.html
              systemctl start apache2
              EOF

  tags = { Name = "Sejal-WebServer1" }   # ✅ made name consistent
}

resource "aws_instance" "web2" {
  ami           = "ami-044415bb13eee2391"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_subnet_2.id
  key_name      = "sejal_terraform"

  vpc_security_group_ids = [aws_security_group.sejal_ec2_sg.id]   # ✅ updated

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y apache2
              echo "Hello from Web2" > /var/www/html/index.html
              systemctl start apache2
              EOF

  tags = { Name = "Sejal-WebServer2" }   # ✅ made name consistent
}

# -------------------------
# EC2 Instance Outputs
# -------------------------
output "web1_instance_id" {
  description = "The ID of Web Server 1"
  value       = aws_instance.Sejal-WebServer1.id
}

output "web1_public_ip" {
  description = "The Public IP of Web Server 1"
  value       = aws_instance.Sejal-WebServer1.public_ip
}

output "web2_instance_id" {
  description = "The ID of Web Server 2"
  value       = aws_instance.Sejal-WebServer2.id
}

output "web2_public_ip" {
  description = "The Public IP of Web Server 2"
  value       = aws_instance.Sejal-WebServer2.public_ip
}

# -------------------------
# VPC Output
# -------------------------
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.sejal_vpc.id
}

# -------------------------
# Subnet Outputs
# -------------------------
output "public_subnet_1_id" {
  description = "The ID of Public Subnet 1"
  value       = aws_subnet.PublicSubnet1.id
}

output "public_subnet_2_id" {
  description = "The ID of Public Subnet 2"
  value       = aws_subnet.PublicSubnet2.id
}

# -------------------------
# Internet Gateway Output
# -------------------------
output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.MyIGW.id
}

# -------------------------
# Security Group Outputs
# -------------------------
output "alb_security_group_id" {
  description = "The ID of the ALB security group"
  value       = aws_security_group.sejal_alb_sg.id
}

# (if you created a separate EC2 SG, keep this; otherwise remove)
output "ec2_security_group_id" {
  description = "The ID of the EC2 security group"
  value       = aws_security_group.sejal_ec2_sg.id
}

# -------------------------
# Load Balancer Outputs
# -------------------------
output "alb_id" {
  description = "The ID of the Application Load Balancer"
  value       = aws_lb.sejal_alb.id
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.sejal_alb.dns_name
}

output "alb_arn" {
  description = "The ARN of the Application Load Balancer"
  value       = aws_lb.sejal_alb.arn
}

# -------------------------
# Target Group Output
# -------------------------
output "target_group_arn" {
  description = "The ARN of the Target Group"
  value       = aws_lb_target_group.sejal_tg.arn
}



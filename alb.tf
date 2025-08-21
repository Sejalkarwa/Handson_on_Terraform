resource "aws_lb" "sejal_alb" {
  name               = "sejal-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sejal_alb_sg.id]   # ✅ updated
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]

  tags = { Name = "SejalALB" }
}

resource "aws_lb_target_group" "sejal_tg" {
  name     = "sejal-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.sejal_vpc.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "sejal_listener" {
  load_balancer_arn = aws_lb.sejal_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.sejal_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "sejal_web1" {   # ✅ renamed for consistency
  target_group_arn = aws_lb_target_group.sejal_tg.arn
  target_id        = aws_instance.web1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "sejal_web2" {   # ✅ renamed for consistency
  target_group_arn = aws_lb_target_group.sejal_tg.arn
  target_id        = aws_instance.web2.id
  port             = 80
}


resource "aws_lb" "this" {
  name               = "${var.project_name}-alb"
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.public_subnet_ids
  idle_timeout       = 60
  tags               = var.tags
}

resource "aws_lb_target_group" "tg" {
  name        = "${var.project_name}-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    enabled            = true
    path               = "/"
    matcher            = "200-399"
    interval           = 30
    healthy_threshold  = 3
    unhealthy_threshold = 3
    timeout            = 5
  }

  tags = var.tags
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = var.enable_https ? "redirect" : "forward"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

    target_group_arn = var.enable_https ? null : aws_lb_target_group.tg.arn
  }
}


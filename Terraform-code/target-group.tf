resource "aws_lb_target_group" "my-target-group" {
  name     = "lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.network.vpc_id
}

resource "aws_lb_target_group_attachment" "my-target-group" {
  target_group_arn = aws_lb_target_group.my-target-group.arn
  target_id        = aws_instance.app_server.id
  port             = 80
}
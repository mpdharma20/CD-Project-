resource "aws_lb" "external_alb"{
    name = "external-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.alb_sg.id]
    subnets = [aws_subnet.public.id, aws_subnet.public2.id]
    }

    resource "aws_lb_target_group" "external_tg" {
    name     = "external-tg"
    port     = 80       
    protocol = "HTTP"
    vpc_id   = aws_vpc.main.id
    }

    resource "aws_lb_listener" "external_listener" {
    load_balancer_arn = aws_lb.external_alb.arn
    port              = "80"
    protocol          = "HTTP"
    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.external_tg.arn
    }
    }

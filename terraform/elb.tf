# Create a new load balancer
resource "aws_elb" "elb" {
  name = "${var.project}-${var.environment}-elb01"
  subnets = ["${aws_subnet.public_subnets.*.id}"]
  security_groups = ["${aws_security_group.sg_elb.id}"]
  cross_zone_load_balancing = true
  connection_draining  = true
  connection_draining_timeout  = "45"
  instances = ["${aws_instance.web.*.id}"]

  listener {
    lb_port = "80"
    lb_protocol = "tcp"
    instance_port = "80"
    instance_protocol = "tcp"
  }
  health_check {
    healthy_threshold = "2"
    unhealthy_threshold = "4"
    timeout = "20"
    interval = "30"
    target = "HTTP:80/"
  }
}

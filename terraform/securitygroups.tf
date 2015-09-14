resource "aws_security_group" "sg_rds" {
  name = "sg_rds"
  description = "Security group that is needed for the RDS"
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups  = ["${aws_security_group.sg_web.id}"]
  }

  tags {
    Name = "${var.project}-${var.environment}-sg_rds"
    Environment = "${var.environment}"
    Project = "${var.project}"
  }
}

resource "aws_security_group" "sg_web" {
  name = "sg_web"
  description = "Security group that is needed for the web servers"
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.project}-${var.environment}-sg_web"
    Environment = "${var.environment}"
    Project = "${var.project}"
  }
}

resource "aws_security_group" "sg_elb" {
  name = "sg_elb_${var.environment}"
  description = "Security group that is needed for the elb"
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups  = ["${aws_security_group.sg_web.id}"]
  }

  tags {
    Name = "${var.project}-${var.environment}-sg_elb"
    Environment = "${var.environment}"
    Project = "${var.project}"
  }
}

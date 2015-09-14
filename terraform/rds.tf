# Create RDS with Subnet,
resource "aws_db_subnet_group" "rds" {
  name = "${var.project}-sta${var.environment}ging-rds"
  description = "Our main group of subnets"
  subnet_ids = ["${aws_subnet.public_subnets.*.id}"]
}

resource "aws_db_instance" "rds" {
  identifier = "${var.project}-${var.environment}-rds01"
  allocated_storage = 10
  engine = "mysql"
  engine_version = "5.6.22"
  instance_class = "db.t2.micro"
  storage_type = "standard"
  username = "root"
  password = "${var.rds_password}"
  vpc_security_group_ids =["${aws_security_group.sg_rds.id}"]
  db_subnet_group_name = "${aws_db_subnet_group.rds.id}"
  multi_az = false
  tags {
    Name = "${var.project}-${var.environment}-rds01"
    Environment = "${var.environment}"
    Project = "${var.project}"
  }
}

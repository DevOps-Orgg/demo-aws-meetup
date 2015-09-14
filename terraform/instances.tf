resource "aws_instance" "web" {
  count = "${var.web_nodes}"
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${element(aws_subnet.public_subnets.*.id, count.index)}"
  key_name  = "${var.key_name}"
  security_groups  = ["${aws_security_group.sg_web.id}"]
  user_data = "${template_file.metadata_web.rendered}"

  root_block_device {
    volume_type = "standard"
    volume_size = "8"
    delete_on_termination = "false"
  }

  tags {
    Name = "${var.project}-${var.environment}-web0${count.index + 1}"
    Environment = "${var.environment}"
    Project = "${var.project}"
  }
}

resource "template_file" "metadata_web" {
    filename = "templates/metadata.tpl"
}

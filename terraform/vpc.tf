# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_block}"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags {
    Name = "${var.project} VPC"
    Environment = "${var.environment}"
    Project = "${var.project}"
  }
}

# Create subnets
resource "aws_subnet" "public_subnets" {
  count = "${var.amount_public_subnets}"
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${element(split(",", var.public_subnets_cidr_blocks), count.index)}"
  availability_zone = "${concat(var.aws_region, lookup(var.subnets, count.index))}"
  map_public_ip_on_launch = true

  tags {
    Name = "${var.project}-public-${concat(var.aws_region, lookup(var.subnets, count.index))}"
    Environment = "${var.environment}"
    Project = "${var.project}"
  }
}

resource "aws_subnet" "private_subnets" {
  count = "${var.amount_private_subnets}"
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${element(split(",", var.private_subnets_cidr_blocks), count.index)}"
  availability_zone = "${concat(var.aws_region, lookup(var.subnets, count.index))}"

  tags {
    Name = "${var.project}-private-${concat(var.aws_region, lookup(var.subnets, count.index))}"
    Environment = "${var.environment}"
    Project = "${var.project}"
  }
}

# Create internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${var.project} bastion internet gateway"
    Environment = "${var.environment}"
    Project = "${var.project}"
  }
}

# Create public route table
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "${var.project} public route table"
    Environment = "${var.environment}"
    Project = "${var.project}"
  }
}

# Associate route table to public subnets
resource "aws_route_table_association" "public_hosts" {
  count = "${var.amount_public_subnets}"
  subnet_id = "${element(aws_subnet.public_subnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}

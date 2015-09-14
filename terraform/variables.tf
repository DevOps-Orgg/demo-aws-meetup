variable "aws_region" {
  description = "The AWS region to work in."
  default = "eu-west-1"
}

variable "access_key" {
  description = "AWS access key"
}

variable "secret_key" {
  description = "AWS secret access key"
}

variable "cidr_block" {
  description = "CIDR block you want to have in your VPC"
  default = "10.0.0.0/16"
}

variable "amount_public_subnets" {
  description = "Amount of subnets you need"
  default = "2"
}

variable "public_subnets_cidr_blocks" {
  description = "Subnets that you need, this needs to be , delimited"
  default =  "10.0.40.0/24,10.0.41.0/24"
}

variable "amount_private_subnets" {
  description = "Amount of subnets you need"
  default = "2"
}

variable "private_subnets_cidr_blocks" {
  description = "Subnets that you need, this needs to be , delimited"
  default =  "10.0.10.0/24,10.0.11.0/24,10.0.12.0/24,10.0.13.0/24"
}

variable "environment" {
  description = "Environment"
  default = "production"
}

variable "project" {
  description = "Environment"
  default = "demo"
}

variable "subnets" {
  description = "Availability zones"
  default = {
    "0" = "a"
    "1" = "b"
    "2" = "c"
    "3" = "d"
  }
}

variable "rds_password" {
  description = "Root password for the rds server"
}

variable "ami" {
  description = "AMI ID for the couchbase instance."
  default = "ami-9d2f0fea"
}

variable "instance_type" {
  description =  "AWS instance type"
  default = "t2.micro"
}

variable "web_nodes" {
  description = "amount of web nodes"
  default = "2"
}

variable "key_name" {
  descirption = "Key name of the user that is doing the deployment"
  default = "mattias"
}

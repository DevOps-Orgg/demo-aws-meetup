# demo-aws-meetup
Cloudformation vs Terraform vs Ansible

## Goal

Write in 3 tech stacks a simple AWS infrastructure. This to compare how long it takes to write. How many lines of code. And maybe check which one runs the fastest?

**The Stack:**

* Create 1 x VPC with 4 x VPC subnets(2 x public and 2 x private) in different AZ zones one AWS region
* Create 1 x security group for each(Webservers,RDS and ELB)
* Provision 2 x EC2 instances(Ubuntu 14.04 LTS) in 2 different public subnets
* Provision 1 x RDS instance in private subnets
* Launch and configure public facing VPC ELB (cross_az_load_balancing) and attach VPC subnets
* Register EC2 instances on ELB


## Ansible

We kept it simple. No dynamic hosts using `ec2.py` and work with tags to get hosts. Just a static hosts file. It took like 30 minutes to hack it together and 20 minutes to test it.

## Cloudformation

Every resource will be created from one cloudformation run/file. It took 1 hour to create and test it.

## Terraform

One Terraform project without any modules. Keeping it simple. It took 30 min to create and test it.

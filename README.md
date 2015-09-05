# demo-aws-meetup
Cloudformation vs Terraform vs Ansible

## Goal

Write in 3 tech stacks a simple AWS infrastructure. This to compare how long it takes to write. How many lines of code. And maybe check which one runs the fastest?

**The Stack:**

* Create 1 x VPC with 3 x VPC subnets(2 x public and 1 x private) in differrent AZ zones one AWS region
* Create 1 x security group for each(Webservers,RDS and ELB)
* Provision 2 x EC2 instances(Ubuntu 14.04 LTS) in 2 different AZ
* Provision 1 x RDS instance in private subnet
* Launch and configure public facing VPC ELB (cross_az_load_balancing) and attach VPC subnets
* Register EC2 instances on ELB


## Ansible

We kept it simple. No dynamic hosts using `ec2.py` and work with tags to get hosts. Just a static hosts file. It took like 30 minutes to hack it together and 20 minutes to test it.

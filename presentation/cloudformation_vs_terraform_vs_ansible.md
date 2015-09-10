# #8 Forming clouds: CloudFormation vs Ansible vs TerraForm

---

![fit](logo-skyscrapers.png)

---

# Geert Theys

![left](GeertTheys.png)

*Sales guy @skyscrapers*

Still likes to get his hands dirty.
<br>
![inline](github.png) [github.com/gtheys](https://github.com/gtheys)
![inline](twitter.png) [twitter.com/toadi](https://twitter.com/toadi)
![inline](home.png) [geerttheys.com](http://geerttheys.com)

---

# Mattias 


---

# [fit] Cloudformation vs
# [fit] Terraform vs
# [fit]Ansible
# [fit] For AWS provisioning

---

# [fit] All different tools

---

# [fit] All have their advantages


---

# [fit] And disadvantages

--- 

# [fit] Lets compare

--- 

# [fit] Simple syntax?

---

# Example 1:

Cloudformation code block

---

# Example 2:

```
resource "aws_instance" "webserver" {
  ami = "${var.ami}"
  instance_type = "t2.micro"
  subnet_id = "${element(split(",", var.subnets), 0)}"
  key_name  = "${var.key_name}"
  security_groups  = ["${var.sg_all}","${aws_security_group.sg_tools.id}"]
  user_data = "#!/bin/bash\n/bin/bash <(/usr/bin/wget -qO- 
  https://raw.githubusercontent.com/skyscrapers/bootstrap/master/autobootstrap.sh) 
  -p puppetmaster -h webserver01 -f webserver01.fqdn.com -t \"UTC\""

  root_block_device {
    volume_type = "standard"
    volume_size = "10"
    delete_on_termination = "false"
  }
  ebs_block_device {
    device_name = "/dev/sdb"
    volume_type = "standard"
    volume_size = "40"
    delete_on_termination = "false"
  }
  tags {
    Name = "${var.name}-${var.environment}-tools01"
    Environment = "${var.environment}"
  }
}
```

--- 

# Example 3:

```
 - name: WebServer | Create the WebServer Instance(s)
   local_action:
     module: ec2
     region: "{{ vpc_region }}"
     group: "{{ web_security_groups[0].sg_name }}"
     keypair: "{{ key_name }}"
     instance_type: "{{ web_instance_type }}"
     image: "{{ imgae_id.ami }}"
     vpc_subnet_id: "{{ item }}"
     assign_public_ip: True
     wait: True
     wait_timeout: 600
     user_data: |
               #!/bin/sh
               sudo apt-get install nginx -y
     instance_tags:
       Name: "{{ vpc_name }}_WEB_Instance"
       Environment: "{{ ENV }}"
       Role: "{{ server_role }}"
       Application: "{{ application }}"
   with_items:
      - "{{ public_subnet_1 }}"
      - "{{ public_subnet_2 }}"
   register: web
```
---

# [fit] Which one was the easiest to read?

--- 

# Easy to install?

![left filtered](brew.jpg)

### Macosx has the fantastic brew:

* `brew install awscli`
* `brew install terraform`
* `brew install ansible`

__Warning:__ None are up to date!

Up to date versions and on linux use `pip install`

---

# Safe to use?

---

# Performant?

---

# How do they keep state?

---

# Do I feel safe

---

# Good deploying more advanced infrastructure?

---

# Performance?

---

# Support?

--- 

# Do you look cool when using it?

---

# Do I want to use it?

---

# Do we recommend 1?

---



#!/bin/bash
/usr/bin/logger -t autobootstrap "Run apt-get update"
sudo apt-get update
/usr/bin/logger -t autobootstrap "Install nginx"
sudo apt-get install nginx -y
/usr/bin/logger -t autobootstrap "Start nginx"
sudo service nginx start

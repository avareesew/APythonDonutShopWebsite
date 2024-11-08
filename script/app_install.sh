#!/bin/bash
cd /home/ec2-user/app

# Install Python 3 and pip (if not already installed)
sudo yum install -y python3
sudo yum install -y python3-pip

# Install necessary Python packages
pip3 install -r requirements.txt

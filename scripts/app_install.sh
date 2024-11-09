#!/bin/bash

# Navigate to the app directory
cd /home/ec2-user/app

# Install Python 3 and pip (if not already installed)
sudo yum install -y python3
sudo yum install -y python3-pip

# Create a virtual environment in the app directory (if not already created)
python3 -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Install necessary Python packages
pip install -r requirements.txt

# Make sure all scripts in the 'scripts' directory are executable
chmod +x scripts/*.sh


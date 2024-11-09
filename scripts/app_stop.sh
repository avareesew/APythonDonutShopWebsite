#!/bin/bash
cd /home/ec2-user/app

# Find the gunicorn process and kill it
pkill gunicorn

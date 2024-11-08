#!/bin/bash
cd /home/ec2-user/app

# Start the Flask app using gunicorn
gunicorn -b 0.0.0.0:8080 app:app &

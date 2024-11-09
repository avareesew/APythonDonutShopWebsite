#!/bin/bash

cd /home/ec2-user/app

# Activate the virtual environment
source venv/bin/activate

# Start the Flask app with Gunicorn (assuming your app is in app.py)
gunicorn --workers 3 --bind 0.0.0.0:8000 app:app


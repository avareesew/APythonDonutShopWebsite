#!/bin/bash

# Navigate to the app directory
cd /home/ec2-user/app

# Attempt to stop Gunicorn if it's running
if pgrep gunicorn > /dev/null
then
    pkill gunicorn
    echo "Stopped Gunicorn process."
else
    echo "No Gunicorn process found."
fi


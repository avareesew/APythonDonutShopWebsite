#!/bin/bash

# Log file path (you can change this to the path where you want to store logs)
LOG_FILE="/home/ec2-user/app_stop.log"

# Navigate to the app directory
cd /home/ec2-user/app

# Check if Gunicorn is running, and stop it if necessary
echo "Checking if Gunicorn process is running..." >> "$LOG_FILE"
if pgrep gunicorn > /dev/null
then
    pkill gunicorn
    echo "Stopped Gunicorn process." >> "$LOG_FILE"
else
    echo "No Gunicorn process found." >> "$LOG_FILE"
fi

echo "Script completed." >> "$LOG_FILE"

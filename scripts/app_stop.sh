#!/bin/bash
set -x  # Enable debugging output

# Navigate to the app directory
cd /home/ec2-user/app || { echo "Failed to cd into /home/ec2-user/app"; exit 1; }

# Attempt to stop Gunicorn if it's running
if /usr/bin/pgrep gunicorn > /dev/null
then
    /usr/bin/pkill gunicorn
    echo "Stopped Gunicorn process."
else
    echo "No Gunicorn process found."
fi

# Explicitly exit with 0 to indicate success
exit 0

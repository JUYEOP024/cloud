#!/bin/bash
# Install Nginx and Python venv if not present
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nginx python3-venv

# Nginx config backup and replacement
sudo mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak 2>/dev/null || true
sudo mv /tmp/default.conf /etc/nginx/sites-available/default

# Reconfigure Nginx
sudo nginx -t
sudo systemctl restart nginx

# Setup Django Environment
echo "Setting up Python Environment..."
cd /home/ubuntu/cloud/01_django_web
python3 -m venv venv
source venv/bin/activate

# Install requirements
pip install -U pip
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
fi
pip install gunicorn

# Start Gunicorn in the background
echo "Starting Gunicorn..."
pkill -f gunicorn || true
nohup gunicorn --bind 0.0.0.0:8000 django_web.wsgi > gunicorn.log 2>&1 &
echo "Everything started successfully!"

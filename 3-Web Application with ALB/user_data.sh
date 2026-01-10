#!/bin/bash
set -e

yum update -y
yum install -y nginx
systemctl start nginx
systemctl enable nginx

HOSTNAME=$(hostname)
IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)

cat <<EOF > /usr/share/nginx/html/index.html
<h1>Web App Running</h1>
<p><strong>Host:</strong> $HOSTNAME</p>
<p><strong>IP:</strong> $IP</p>
EOF

#!/bin/bash

set -e

apt-get update -y
apt-get install -y nginx

cat <<'EOF' > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Terraform Enterprise Demo</title>
</head>
<body>
    <h1>Hello from Terraform Enterprise!</h1>
    <p>This EC2 instance was created using Terraform.</p>
    <p>Infrastructure as Code is powerful.</p>
</body>
</html>
EOF

systemctl enable nginx
systemctl start nginx
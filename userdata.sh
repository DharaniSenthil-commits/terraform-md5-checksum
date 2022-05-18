#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
echo "Hi Friend , I am $(hostname -f)" > /var/www/html/index.html

Access Key ID:
AKIAW3MTRID44TTVMTW6
Secret Access Key:
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
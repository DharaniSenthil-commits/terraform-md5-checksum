#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
echo "Hi Friend , I am $(hostname -f)" > /var/www/html/index.html


connection {
    type     = "ssh"
    user     = "ec-user"
    password = ""
    host     = self.public_ip
    }

    provisioner "file" {
    source      = file("modules/ec2/init.sh")
    destination = "/home/ec2-user/init.sh"
  }

    connection {
    type     = "ssh"
    user     = "root"
    password = ""
    host     = self.public_ip
    }

    
    provisioner "remote-exec" {
    inline = [
"chmod +x /home/ec2-user/init.sh",
      "/home/ec2-user/init.sh"
          
    ]
  }

    security_groups = "${aws_security_group.tf_sg.id}" 
provisioner "remote-exec" {
    inline = [
    "cd /home/ec2-user",
    "aws s3 cp s3://tf-md5-checksum/requirement.txt requirement.txt",
    "pip3 install -r requirement.txt",
    "aws s3 cp s3://tf-md5-checksum/python_scripts/md5_checksum.py md5_checksum.py",
    "python3 md5_checksum.py"

 
    ]
  }
  provisioner "remote-exec" {
    inline = [
    "chmod +x /temp/init.sh",
    "/temp/init.sh args"
    ]
  }

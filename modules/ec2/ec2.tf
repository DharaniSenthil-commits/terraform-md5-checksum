resource "aws_instance" "ec2-from-tf" {
    ami=var.ami
    instance_type = var.instance_type
    tags={
        Name=var.tags_name
    }
    iam_instance_profile = "arn:aws:iam::078610788248:instance-profile/ec2-role****"
    #security_groups =var.aws_security_group
    
    user_data = <<-EOF
                #!/bin/bash -xe
                exec > 
                aws s3 cp s3://tf-md5-checksum/requirement.txt requirement.txt
                pip3 install -r requirement.txt
                aws s3 cp s3://tf-md5-checksum/python_scripts/md5_checksum.py md5_checksum.py
                python3 md5_checksum.py
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                
                EOF

}
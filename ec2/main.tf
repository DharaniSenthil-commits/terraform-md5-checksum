resource "aws_instance" "Instance_to_upload_df" {
    ami=var.ami
    instance_type = var.instance_type
    tags={
        Name=var.tags_name
    }
    key_name = var.key_name
    user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend , I am $(hostname -f) hosted by Terraform" > /var/www/html/index.html
                EOF

}
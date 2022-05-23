resource "aws_instance" "ec2-from-tf" {
    ami=var.ami
    instance_type = var.instance_type
    tags={
        Name=var.tags_name
    }
    iam_instance_profile = var.iam_instance_profile
    
    key_name = var.key_name

  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("modules/learn_key.pem")
    host     = self.public_ip
    }

    provisioner "remote-exec" {
    inline = [
    "cd /home/ec2-user",
    "aws s3 cp s3://tf-md5-checksum/requirement.txt requirement.txt",
    "pip3 install -r requirement.txt",
    "aws s3 cp s3://tf-md5-checksum/python_scripts/md5_checksum.py md5_checksum.py",
    "python3 md5_checksum.py"

 
    ]
  }

    
}

    

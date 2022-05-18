variable "ami" {
  default="ami-079b5e5b3971bd10d"
}
variable "instance_type" {
    default = "t2.micro"  
}
variable "tags_name" {
    default = "Ec2_upload_df"
}
variable "key_name" {
  default="learn_key"
}

variable "aws_security_group" {
  default= ["${"aws_security_group.tf_sg.id"}"]
}

variable "access_key" {
  default="AKIARETMRN6MPWL257ZB"
}
variable "secret_key" {
    default = "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"
  
}
variable "region" {
    default = "ap-south-1"
}

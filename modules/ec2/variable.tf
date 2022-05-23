variable "ami" {
  default=""

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

variable "iam_instance_profile"{

}


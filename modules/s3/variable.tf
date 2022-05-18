
variable "tags_name" {
    default = "Bucket-via-tf"
}

variable "region" {
    default = "ap-south-1"
}

variable "s3_folders" {
  type=list
  default = ["Data","Input","Output"]
}
variable "acl"{
    default = "private"
}

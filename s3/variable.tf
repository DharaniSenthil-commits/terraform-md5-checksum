
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
variable "access_key" {
  default="AKIAW3MTRID44MXAABO3"
}
variable "secret_key" {
    default = "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"
  
}
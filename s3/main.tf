resource "aws_s3_bucket" "tf-bt-md5-checksum" {
  bucket = "tf-bt-md5-checksum"
  acl=var.acl
}

resource "aws_s3_object" "folders" {
  count="${length(var.s3_folders)}"
  bucket = "${aws_s3_bucket.tf-bt-md5-checksum.id}"
  key    = "${var.s3_folders[count.index]}/"
}

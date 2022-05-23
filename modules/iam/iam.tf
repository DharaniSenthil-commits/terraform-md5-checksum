resource "aws_iam_policy" "tf_s3_policy" {
    name="tf_s3_policy"
    policy = file("modules/iam/config_policy/s3-access-policy.json")
}

resource "aws_iam_role" "tf_ec2_role" {
  name = "tf_ec2_role"
  description="Role for Ec2"
  assume_role_policy = file("modules/iam/config_policy/ec2-role.json")
}

resource "aws_iam_policy_attachment" "ec2_s3_role"{

  name ="ec2_s3_attachment"
  roles = ["${aws_iam_role.tf_ec2_role.name}"]
  policy_arn = aws_iam_policy.tf_s3_policy.arn
}

resource "aws_iam_instance_profile" "ec2_s3_profile" {
  
  name="ec2_s3_profile"
  role=aws_iam_role.tf_ec2_role.name
}


resource "aws_iam_role_policy" "ec2-role-policy" {
    name="ec2-role-policy"
    role="${aws_iam_role.ec2-role.id}"
    policy = file("modules/iam/config_policy/s3-access-policy.json")
}

resource "aws_iam_role" "ec2-role" {
  name = "ec2-role"
  description="Role for Ec2"
  assume_role_policy = file("modules/iam/config_policy/ec2-role.json")
}

resource "aws_iam_instance_profile" "ec2-role" {
  name="ec2-profile"
  role="${"aws_iam_role.ec2-role.name"}"
}


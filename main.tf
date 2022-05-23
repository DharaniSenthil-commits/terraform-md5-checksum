module "iam" {
  source="./modules/iam"
}


module "ec2" {
     source="./modules/ec2"
     iam_instance_profile=module.iam.instance_profile_name
     #aws_security_group=module.securitygroup.aws_security_group
 }


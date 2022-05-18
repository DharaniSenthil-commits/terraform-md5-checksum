

 module "ec2" {
     source="./modules/ec2"
     #iam_instance_profile=module.iam.instance_profile_name
 }


# module "s3"{
#     source = "./modules/s3"
# }
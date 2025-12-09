module "ec2" {
  for_each = var.instances
  source = "../modules/ec2"
  
  ami_id = each.value["ami_id"]
  env = var.env
  zone_id = data.aws_route53_zone.get_zone_id.id
  name = each.key
  vpc_security_group_ids = var.security_groups
  instance_type = each.value.instance_type

}

data "aws_route53_zone" "get_zone_id" {
 name = "kommanuthala.store"
}

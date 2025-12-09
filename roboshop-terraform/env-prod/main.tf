module "ec2" {
    for_each = var.instances
  source = "../modules/ec2"
  zone_id = data.aws_route53_zone.get_zone_id.id
  instance_type = each.value["instance_type"]
  ami_id = each.value.ami_id
  vpc_security_group_ids = v
  env = prod
  name = each.key
}


data "aws_route53_zone" "get_zone_id" {
  name = "kommanuthala.store"
}
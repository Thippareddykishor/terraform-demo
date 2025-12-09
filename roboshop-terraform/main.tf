module "ec2" {
  for_each = var.instances
  source = "./ec2"
  
  ami_id = each.value["ami_id"]
  env = var.env
  zone_id = data.aws_route53_zone.get_zone_id.id
  name = each.key
  vpc_security_group_ids = var.security_groups
  instance_type = var.instance_type

}

data "aws_route53_zone" "get_zone_id" {
 name = "kommanuthala.store"
}

# provider "aws" {
#   region = "us-east-1"
# }

# resource "aws_instance" "ec2" {
#   # count = length(var.instances)
#   for_each = var.instances
#   ami = var.ami
#   instance_type = var.instance_type
#   vpc_security_group_ids = var.security_groups
  
#   tags = {
#     Name = each.key
#     # Name = var.instances[count.index]
#   }

# }

# # resource "null_resource" "ec2-null" {
# # provisioner "remote-exec" {
# #     connection {
# #       type = "ssh"
# #       user = "ec2-user"
# #       password = "DevOps321"
# #       host = aws_instance.ec2.public_ip
# #     }
# #     inline = [ 
# #         "pip3.11 install ansible",
# #         "ansible-pull -i localhost, -U https://github.com/Thippareddykishor/ansible-test roboshop.yml -e component_name=frontend -e env=dev"
# #      ]
# # }  
# # }


# data "aws_route53_zone" "zoneId" {
#   private_zone = false
#   name = "kommanuthala.store"
# }

# resource "aws_route53_record" "ec2" {
#   # count = length(var.instances)
#   for_each = var.instances
#   records = [aws_instance.ec2[each.key].private_ip]
#   zone_id = data.aws_route53_zone.zoneId.id
#   type = "A"
#   ttl = "10"
#   name = "${each.key}-${var.env}"

# }
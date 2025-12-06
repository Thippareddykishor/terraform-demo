provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  count = length(var.instances)
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups
  
  tags = {
    Name = var.instances[count.index]
  }

}

resource "null_resource" "ec2-null" {
provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = aws_instance.ec2.public_ip
    }
    inline = [ 
        "pip3.11 install ansible",
        "ansible-pull -i localhost, -U https://github.com/Thippareddykishor/ansible-test roboshop.yml -e component_name=frontend -e env=dev"
     ]
}  
}


data "aws_route53_zone" "zoneId" {
  private_zone = false
  name = "kommanuthala.store"
}

resource "aws_route53_record" "ec2" {
  count = length(var.instances)
  records = [aws_instance.ec2[count.index].private_ip]
  zone_id = data.aws_route53_zone.zoneId.id
  type = "A"
  ttl = "10"
  name = "${var.instances[count.index]}-${var.env}"

}
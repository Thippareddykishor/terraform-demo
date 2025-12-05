provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups
  
  tags = {
    Name = "frontend"
  }

}

data "aws_route53_zone" "zoneId" {
  private_zone = false
  name = "kommanuthala.store"
}

resource "aws_route53_record" "ec2" {
  records = [aws_instance.ec2.private_ip]
  zone_id = data.aws_route53_zone.zoneId.id
  type = "A"
  ttl = "10"
  name ="frontend-dev" 

}
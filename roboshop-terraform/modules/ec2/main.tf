resource "aws_instance" "instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = var.name
  }
}

resource "aws_route53_record" "record" {
  zone_id = var.zone_id
  name = "${var.name}-${var.env}"
  ttl = 10
  type = "A"
  records = [aws_instance.instance.private_ip]
}
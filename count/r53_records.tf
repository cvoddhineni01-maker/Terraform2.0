

 resource "aws_route53_record" "roboshop" {
  count = 3
  name            = "${var.instances[count.index]}.${var.domain_name}" 
  ttl             = 1
  type            = "A"
  zone_id         = var.zone_id

  records = [aws_instance.instance_with_terraform_example[count.index].private_ip]
  allow_overwrite = true
} 

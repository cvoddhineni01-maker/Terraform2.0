resource "aws_route53_record" "r53_record" {
    for_each = aws_instance.instance_with_terraform_example
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" #mongdb.devopsplayground.fun

  type    = "A"
  ttl     = 300
  records = [each.value.private_ip] #private ip address 
}

resource "aws_route53_record" "fomillercloud_subdomain_public_ns" {
  allow_overwrite = true
  name            = "${var.environment}.aws.fomillercloud"
  ttl             = 172800
  type            = "NS"
  zone_id         = data.aws_route53_zone.fomillercloud.zone_id

  records = var.fomillercloud_name_servers
}

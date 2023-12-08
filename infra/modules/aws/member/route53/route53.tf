resource "aws_route53_zone" "fomillercloud_subdomain_public" {
  name = "${var.environment}.aws.fomillercloud.com"
}

resource "aws_route53_record" "fomillercloud_subdomain_public_ns" {
  provider        = aws.org
  allow_overwrite = true
  name            = "${var.environment}.aws.fomillercloud.com"
  ttl             = 172800
  type            = "NS"
  zone_id         = aws_route53_zone.fomillercloud_subdomain_public.zone_id

  records = aws_route53_zone.fomillercloud_subdomain_public.name_servers
}

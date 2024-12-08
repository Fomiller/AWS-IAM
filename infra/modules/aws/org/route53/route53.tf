resource "aws_route53domains_registered_domain" "fomiller" {
  domain_name = "fomiller.com"
}

resource "aws_route53_record" "fomiller" {
  zone_id = data.aws_route53_zone.fomiller.zone_id
  name    = ""
  type    = "A"

  alias {
    name                   = var.s3_bucket_website_domain_fomiller
    zone_id                = var.s3_bucket_hosted_zone_id_fomiller
    evaluate_target_health = false
  }
}

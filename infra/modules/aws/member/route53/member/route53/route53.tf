resource "aws_route53_zone" "fomillercloud_subdomain_public" {
  provider = aws.member
  name     = "${var.environment}.aws.fomillercloud.com"
}

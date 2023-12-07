data "aws_route53_zone" "fomiller" {
  provider = var.alias
  name     = "fomiller.com"
}

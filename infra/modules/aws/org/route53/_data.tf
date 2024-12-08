data "aws_route53_zone" "fomiller" {
  name         = "fomiller.com"
  private_zone = false
}

output "route53_zone_name_fomiller" {
  value = data.aws_route53_zone.fomiller.name
}

output "route53_zone_id_fomiller" {
  value = data.aws_route53_zone.fomiller.zone_id
}

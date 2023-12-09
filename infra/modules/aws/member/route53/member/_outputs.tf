output "fomillercloud_subdomain_public_arn" {
  value = aws_route53_zone.fomillercloud_subdomain_public.arn
}

output "fomillercloud_subdomain_public_zone_id" {
  value = aws_route53_zone.fomillercloud_subdomain_public.zone_id
}

output "fomillercloud_name_servers" {
  value = aws_route53_zone.fomillercloud_subdomain_public.name_servers
}

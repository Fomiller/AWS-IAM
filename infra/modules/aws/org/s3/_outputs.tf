output "s3_bucket_website_domain_fomiller" {
  value = aws_s3_bucket_website_configuration.fomiller.website_domain
}

output "s3_bucket_hosted_zone_id_fomiller" {
  value = aws_s3_bucket.fomiller.hosted_zone_id
}

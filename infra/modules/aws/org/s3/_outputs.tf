output "s3_bucket_website_endpoint_fomiller" {
  value = aws_s3_bucket_website_configuration.fomiller.website_endpoint
}

output "s3_bucket_hosted_zone_id_fomiller" {
  value = aws_s3_bucket.fomiller.hosted_zone_id
}

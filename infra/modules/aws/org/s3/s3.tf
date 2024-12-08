resource "aws_s3_bucket" "fomiller" {
  bucket = "fomiller.com"
}

resource "aws_s3_bucket_website_configuration" "fomiller" {
  bucket = aws_s3_bucket.fomiller.id

  redirect_all_requests_to {
    host_name = "github.com/Fomiller"
  }
}

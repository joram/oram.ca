locals {
  s3_origin_id = "S3-oram.ca"
}

resource "aws_cloudfront_distribution" "s3_distribution" {

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  price_class         = "PriceClass_100"
  tags                = var.default_tags
  aliases = [aws_s3_bucket.oram_ca.bucket]

  origin {
    domain_name = aws_s3_bucket.oram_ca.bucket_domain_name
    origin_id   = local.s3_origin_id
  }

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 400
    response_code         = 200
    response_page_path    = "/index.html"
  }

//  logging_config {
//    include_cookies = false
//    bucket          = "oram.ca.logs.s3.amazonaws.com"
//  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }


  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn            = "arn:aws:acm:us-east-1:431568096872:certificate/118be7dd-e83c-402e-b38e-feaa4956734c"
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.1_2016"
  }
}
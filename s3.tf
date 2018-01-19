resource "aws_s3_bucket" "client" {
  bucket = "${var.DOMAIN_NAME}"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  tags {
    Environment = "Production"
    Terraform   = "Yes"
  }
}

resource "aws_s3_bucket" "client-www-redirect" {
  bucket = "www.${var.DOMAIN_NAME}"
  acl    = "private"

  website {
    redirect_all_requests_to = "https://${var.DOMAIN_NAME}"
  }

  tags {
    Environment = "Production"
    Terraform   = "Yes"
  }
}

resource "aws_route53_zone" "client" {
  name    = "${var.DOMAIN_NAME}."
  comment = "Managed by Terraform"

  tags {
    Environment = "Production"
    Terraform   = "Yes"
  }
}

resource "aws_route53_record" "client-a-record" {
  zone_id = "${aws_route53_zone.client.zone_id}"
  name    = "${var.DOMAIN_NAME}"
  type    = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.client.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.client.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "client-www-redirect-a-record" {
  zone_id = "${aws_route53_zone.client.zone_id}"
  name    = "www.${var.DOMAIN_NAME}"
  type    = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.client-www-redirect.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.client-www-redirect.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "jenkins" {
  name = "${var.subdomain}-jenkins.${var.domain}"
  type = "A"
  zone_id = "${data.aws_route53_zone.primary.id}"

  records = ["${}"]
}
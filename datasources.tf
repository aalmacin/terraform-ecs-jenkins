data "aws_route53_zone" "primary" {
  name = "${var.hosted_zone}"
}

data "template_file" "containers" {
  template = "${file("${path.module}/appContainerDefinitions.json")}"
}

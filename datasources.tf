data "aws_route53_zone" "primary" {
  name = "${var.hosted_zone}"
}

data "template_file" "containers" {
  template = "${file("${path.module}/appContainerDefinitions.json")}"

  vars {
    "aws_region" = "${var.aws_region}"
  }
}

data "aws_subnet" "selected" {
  id = "${var.subnet_id}"
}

data "aws_security_group" "selected" {
  id = "${var.security_group_id}"
}

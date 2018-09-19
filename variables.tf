variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}

variable "app_name" {
  description = "Name of the jenkins app"
  default = "jenkins"
}

variable "jenkins_docker_image" {
  description = "Docker image for Jenkins"
  default = "jenkins"
}

variable "hosted_zone" {}

variable "subnet_id" {}

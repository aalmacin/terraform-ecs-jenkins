resource "aws_ecs_cluster" "jenkins" {
  name = "${var.app_name}"
}

resource "aws_ecs_service" "jenkins" {
  name = "${var.app_name}"
  task_definition = "${aws_ecs_task_definition.appECSTaskDefinition.arn}"
  desired_count = 1
  health_check_grace_period_seconds=300
  cluster = "${aws_ecs_cluster.jenkins.arn}"

  launch_type = "FARGATE"
}

resource "aws_ecs_task_definition" "appECSTaskDefinition" {
  family = "${var.app_name}"
  container_definitions = "${data.template_file.containers.rendered}"
  network_mode = "awsvpc"
  cpu = 1024
  memory = 2048
  requires_compatibilities = ["FARGATE"]
}



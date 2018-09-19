
resource "aws_ecs_cluster" "jenkins" {
  name = "${var.app_name}"
}

resource "aws_ecs_service" "jenkins" {
  name = "${var.app_name}"
  task_definition = "${aws_ecs_task_definition.appECSTaskDefinition.arn}"
  desired_count = 1
  cluster = "${aws_ecs_cluster.jenkins.arn}"

  launch_type = "FARGATE"
  network_configuration {
    assign_public_ip = true
    security_groups = [
      "${data.aws_security_group.selected.id}"
    ]
    subnets = [
      "${data.aws_subnet.selected.id}"
    ]
  }
}

resource "aws_ecs_task_definition" "appECSTaskDefinition" {
  family = "${var.app_name}"
  container_definitions = "${data.template_file.containers.rendered}"
  execution_role_arn = "${var.execution_role_arn}"
  network_mode = "awsvpc"
  cpu = 1024
  memory = 2048
  requires_compatibilities = ["FARGATE"]
}



terraform {

  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
  access_key=  var.access_key
  secret_key= var.secret_key # Specify your desired region
}
resource "aws_iam_user" "user1" {
  name = "dev_user1"
}
resource "aws_iam_access_key" "user-access1" {
  user = aws_iam_user.user1
}
resource "aws_iam_user_policy_attachment" "admin_policy"{
  user = aws_iam_user.user1
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

#resource "aws_ecs_cluster" "ecs_cluster" {
#  name = "training-ecs-cluster"
#}
#
#resource "aws_ecs_task_definition" "task1"{
#  family = "test-task"
#  cpu = "256"
#  memory = "512"
#  requires_compatibilities = ["FARGATE"]
#  container_definitions = <<DEFINITION
#  [
#    {
#      "name": "my-container",
#      "image": "nginx:latest",  # Specify the Docker image for your container
#      "cpu": 256,
#      "memory": 512
#    }
#  ]
#  DEFINITION
#}
#
#resource "aws_ecs_service" "my_service"{
#  container_definitions = <<DEFINITION
#  [
#    {
#      "name": "my-container",
#      "image": "aravindssr/rate-limit-0325-2:latest,  # Specify the Docker image for your container
#      "cpu": 256,
#      "memory": 512
#    }
#  ]
#  DEFINITION
#}

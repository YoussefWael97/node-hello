provider "aws" {
  region = "us-east-1" # Set your desired AWS region
  profile = "joe-wael-programmatic"
}

resource "aws_ecs_cluster" "nodejs-cluster" {
  name = "nodejs-cluster"

}

resource "aws_ecs_task_definition" "nodejs-task" {
  family = "nodejs-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 512
  memory                   = 1024

  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "nodejs-hello-world",
    "image": "youssefwael97/hello_repo",
    "cpu": 512,
    "memory": 1024,
    "essential": true,
    "portMappings": [
        {
            "name": "nodejs-3000-tcp",
            "containerPort": 3000,
            "hostPort": 3000,
            "protocol": "tcp",
            "appProtocol": "http"
        }
    ],
    "healthCheck": {
        "command": [
            "CMD-SHELL",
            "curl -f http://localhost:3000 || exit 1"
        ],
        "interval": 30,
        "timeout": 5,
        "retries": 3
    }
  }
]
TASK_DEFINITION

}

resource "aws_ecs_service" "nodejs-service" {
  name            = "nodejs-service"
  cluster         = aws_ecs_cluster.nodejs-cluster.id
  task_definition = aws_ecs_task_definition.nodejs-task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = ["subnet-047ef35e779328b92"] # Specify your subnet IDs
    security_groups = ["sg-0f4c432deb65b49e8"]     # Specify your security group IDs
    assign_public_ip = true
  }
}
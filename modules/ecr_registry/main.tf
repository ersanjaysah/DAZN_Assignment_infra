resource "aws_ecr_repository" "my_ecr_repo" {
  name                 = var.reponame # Desired name for your ECR repository
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags= {
    env =var.envtag
  }
}


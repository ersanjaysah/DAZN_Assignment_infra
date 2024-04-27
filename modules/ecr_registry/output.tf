
output "ecr_repository_url" {
  value = try(aws_ecr_repository.my_ecr_repo.repository_url, "")
}
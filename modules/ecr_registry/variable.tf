variable "reponame" {
  default="my_ecr_repo_name"  // here we can override the default value by passing in .tfvars
  description = "This is ecr repository name"
}
variable "envtag" {
  default= "dev"
  description = "this is tag variable"
}


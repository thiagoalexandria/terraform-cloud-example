provider "aws" {
  region = "sa-east-1"
}

terraform {
  backend "remote" {
    organization = "thiagoalexandria-org"

    workspaces {
      name = "terraform-cloud-example"
    }
  }
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  required_version = ">= 1.1.0"
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ecr_image" "service_image" {
  repository_name = var.ecr_image_repository
  image_tag       = var.ecr_image_tag
}

output "VMCount" {
  value = "${data.aws_ecr_image.service_image.id}"
}
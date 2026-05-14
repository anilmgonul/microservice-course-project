terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.41.0"
    }
  }

  backend "s3" {
    bucket  = "course-project-terraform-states"
    encrypt = true
    key     = "terraform/eks/terraform.tfstate"
    region  = "eu-north-1"
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      owner = "anilgonul"
    }
  }
}

variable "region" {
  description = "aws region"
  default     = "eu-north-1"
}
terraform {

  backend "s3" {
    bucket  = "<account-d>-terraform-states"
    key     = "development/aws-ec2.tfstate"
    encrypt = true
    region  = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }

  required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 6.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "test_server" {
    ami = "ami-1234"
    instance_type = "t2.micro"

    tags = {
        Name = "Terraform_Demo"
    }
}
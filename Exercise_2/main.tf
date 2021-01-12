terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.23"
    }
  }
}
provider "aws" {
  region = var.aws_region
  profile = "projects"
}

module "lambda_function" {
    source = "terraform-aws-modules/lambda/aws"
    version = "1.31.0"

    function_name = "project2-lambda-function"
    description = "Lambda Function for Project 2"
    handler = "greet_lambda.lambda_handler"
    runtime = "python3.8"

    source_path = "./greet_lambda.py"

    tags = {
        Name = "project2-lambda-function"
    }

    environment_variables = {
        greeting = "AWS Solution Architect Nanodegree Project 2"
    }
    
}
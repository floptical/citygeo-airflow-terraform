terraform {
  required_version = "~> 0.13"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


module "airflow" {
    source = "datarootsio/ecs-airflow/aws"

    resource_prefix = "citygeo"
    resource_suffix = "airflow-ecs"

    vpc_id             = var.vpc_id

    use_https = false

    rds_username = "rds_superuser" 
    rds_password = var.rds_password
}


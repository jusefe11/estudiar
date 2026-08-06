terraform {

  backend "s3" {

    bucket = "terraform-state-jusefe11-2026-devops"

    key = "dev/terraform.tfstate"

    region = "us-east-1"

    dynamodb_table = "terraform-locks"

    encrypt = true

  }

}
terraform {
  backend "s3" {
    bucket = "aws-terraform-resources-statefiles"
    key    = "terraform-state-files/terraform.tf"
    region = "ap-south-2"
  }
}

terraform {
  backend "s3" {
    bucket = "cicd-terraform-eks-poc"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}
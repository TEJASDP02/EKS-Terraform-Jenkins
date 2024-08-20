terraform {
  backend "s3" {
    bucket = "cicd-terraform-eks-poc"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}

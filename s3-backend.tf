terraform {
  backend "s3" {
    bucket = "terraform-devops-test"
    key    = "state-test/backend"
    region = "us-east-2"
  }
}

terraform {
  backend "s3" {
    region = "ap-south-1"
    bucket = "terraform-training-badhon-biswas-test"
    key    = "terraform-training-badhon-biswas-test/remote-backend/terraform.tfstate"
    dynamodb_table = "terraform-training-dynamodb"
  }
}

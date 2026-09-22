# Creating a S3 bucket

resource "aws_s3_bucket" "s3" {
  bucket = "cliniCall-limited-s3-bucket"
  tags = {
    "Name"  = "badhon-biswas"
    "Owner" = "cliniCall-limited"
  }
}


# Creating a RDS Database

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "terraform-training-dynamodb"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }

  attribute {
    name = "TopScore"
    type = "N"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = true
  }

  global_secondary_index {
    name               = "GameTitleIndex"
    hash_key           = "GameTitle"
    range_key          = "TopScore"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["UserId"]
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}

# terraform {
#   backend "s3" {
#     region         = "ap-south-1"
#     bucket         = "cliniCall-limited-s3-bucket"
#     key            = "cliniCall-limited-s3-bucket/terraform/terraform.tfstate"
#     dynamodb_table = "terraform-training-dynamodb"
#   }
# }

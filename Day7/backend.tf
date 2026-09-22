# # Creation of S3

# resource "aws_s3_bucket" "s3" {
#   bucket = "badhon-clinicall-biswas-s3"
#   tags = {
#     Name = "badhon-clinicall-biswas-s3"
#   }
# }


# # Dynamodb table

# resource "aws_dynamodb_table" "Dynamodb" {
#   name         = "table-of-clinicall"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
#   tags = {
#     name = "table"
#   }
# }

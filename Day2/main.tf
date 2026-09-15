# create s3 bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = "badhon_new_bucket_12345"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
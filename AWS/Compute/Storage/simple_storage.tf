# Create S3 storage 
resource "aws_s3_bucket" "example" {
  bucket = var.aws_s3_bucket_name
  tags = {
    Name        = "techademy"
    Environment = "Dev"

  }
}
/*
resource "aws_s3_access_point" "example" {
  bucket = aws_s3_bucket.example.id
  name   = var.aws_s3_bucket_name
}
*/

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.example.id
  acl = "private"
}


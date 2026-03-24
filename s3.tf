# s3.tf

resource "aws_s3_bucket" "logging" {
  bucket = var.bucket_name

  tags = {
    account_lifecycle = var.account_lifecycle
    managed_by        = "opentofu"
    project           = "anvil"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "logging" {
  bucket = aws_s3_bucket.logging.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "logging" {
  bucket = aws_s3_bucket.logging.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}
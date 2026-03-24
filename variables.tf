# variables.tf

variable "account_lifecycle" {
  description = "Environment designator — drives resource naming and state key selection (test or main)"
  type        = string

  validation {
    condition     = contains(["test", "main"], var.account_lifecycle)
    error_message = "account_lifecycle must be either 'test' or 'main'."
  }
}

variable "bucket_name" {
  description = "Name of the S3 logging bucket to deploy"
  type        = string
}

variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}

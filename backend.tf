# backend.tf

terraform {
  backend "s3" {
    bucket         = "anvil-tofu-state"
    region         = "us-east-1"
    dynamodb_table = "anvil-tofu-locks"
    encrypt        = true
    # key is intentionally omitted here
    # it is passed at init time via -backend-config="key=<env>/terraform.tfstate"
    # in the pipeline set-values job output
  }
}
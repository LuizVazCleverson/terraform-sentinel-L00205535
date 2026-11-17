provider "aws" {
  region = var.aws_region
  # These settings permit local planning with dummy credentials; do not apply.
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
}

# Configure the Confluent Provider
terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = "1.39.0"
    }
  }
}
provider "confluent" {
  cloud_api_key = var.confluent_credentials.cloud_api_key    # optionally use CONFLUENT_CLOUD_API_KEY env var
  cloud_api_secret = var.confluent_credentials.cloud_api_secret # optionally use CONFLUENT_CLOUD_API_SECRET env var
}


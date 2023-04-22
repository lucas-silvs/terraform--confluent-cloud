resource "confluent_service_account" "service-account" {
  display_name = "pipeline-sa" # Nome do Service Account
  description  = "Service Account teste para criação de recurso pelo terraform"  # Descrição do Service Account
}
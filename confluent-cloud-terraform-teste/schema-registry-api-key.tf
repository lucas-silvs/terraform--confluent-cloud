resource "confluent_api_key" "schema-registry-api-key" {
  display_name = "schema-registry-api-key"
  description  = "schema registry para manutenção dos schemas registrys"
  owner {
    id          = confluent_service_account.service-account.id # ID do service account criado no terraform
    api_version = confluent_service_account.service-account.api_version # api version do service account criado no terraform
    kind        = confluent_service_account.service-account.kind # tipo de account, que no caso é um service accoumt criado no terraform
  }

  managed_resource {
    id          = confluent_schema_registry_cluster.schema-registry-teste.id # id do cluster kafka basic criado no terraform
    api_version = confluent_schema_registry_cluster.schema-registry-teste.api_version # api version do cluster kafka criado no terraform
    kind        = confluent_schema_registry_cluster.schema-registry-teste.kind # tipo do cluster (BASIC, STANDARD ou DEDICATED)

    environment {
      id = confluent_environment.test.id  # id do ambiente Confluent
    }
  }
}

output "schema-key-id" {
  value = confluent_api_key.schema-registry-api-key.id # schema key ID que será printada no terminal para uso de testes
}

output "schema-key-secret" {
  value = confluent_api_key.schema-registry-api-key.secret # schema key secret que será printada no terminal, mas protegida pela flag <sensitive>
  sensitive = true
}
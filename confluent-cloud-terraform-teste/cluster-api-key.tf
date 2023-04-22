resource "confluent_api_key" "api-key-cluster" {
  display_name = "api-key-terraform"
  description  = "API Key responsavel por criação de recursos dentro de um cluster"
  owner {
    id          = confluent_service_account.service-account.id # ID do service account criado no terraform
    api_version = confluent_service_account.service-account.api_version # api version do service account criado no terraform
    kind        = confluent_service_account.service-account.kind # tipo de account, que no caso é um service accoumt criado no terraform
  }

  managed_resource {
    id          = confluent_kafka_cluster.basic-cluster.id # id do cluster kafka basic criado no terraform
    api_version = confluent_kafka_cluster.basic-cluster.api_version # api version do cluster kafka criado no terraform
    kind        = confluent_kafka_cluster.basic-cluster.kind # tipo do cluster (BASIC, STANDARD ou DEDICATED)

    environment {
      id = confluent_environment.test.id # id do ambiente Confluent
    }
  }
}

output "api-key-id" {
  value = confluent_api_key.api-key-cluster.id # api key ID que será printada no terminal para uso de testes
}

output "api-key-secret" {
  value = confluent_api_key.api-key-cluster.secret # api key secret que será printada no terminal, mas protegida pela flag <sensitive>
  sensitive = true
}
resource "confluent_schema" "topic-schema-teste" {

  schema_registry_cluster {
    id = confluent_schema_registry_cluster.schema-registry-teste.id # Id do Schema Registry criado
  }

   credentials {
    key    = confluent_api_key.schema-registry-api-key.id # Schema api key para manutenção do Schema
    secret = confluent_api_key.schema-registry-api-key.secret# Schema api secret para manutenção do Schema
  }

  rest_endpoint = confluent_schema_registry_cluster.schema-registry-teste.rest_endpoint # Rest Endpoint Schema Registry para execução da manutenção
  subject_name = "${var.topico.nome}-value" # Nome do Schema Registry, utilizando nome do tópico criado concatenado com "-value"
  format = "AVRO" # Formato do Schema Registry, tendo os seguintes formatos disponiveis: AVRO, PROTOBUF, e JSON
  schema = file("./schemas/avro/UsuarioTeste.avsc") # Caminho onde o arquivo avsc do Schema está hospedado para envio da nova versão

}
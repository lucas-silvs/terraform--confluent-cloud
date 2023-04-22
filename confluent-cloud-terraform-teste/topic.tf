resource "confluent_kafka_topic" "topico" {
  kafka_cluster {
    id = confluent_kafka_cluster.basic-cluster.id # Id do Cluster Kafka
  }
  topic_name         = var.topico.nome # Nome do Tópico
  rest_endpoint      = confluent_kafka_cluster.basic-cluster.rest_endpoint # Rest Endpoint Cluster Kafka
  credentials {
    key    = confluent_api_key.api-key-cluster.id # Api Key ID para criação do Tópico no Cluster Kafka
    secret = confluent_api_key.api-key-cluster.secret # Api Key Secret para criação do Tópico no Cluster Kafka
  }

}
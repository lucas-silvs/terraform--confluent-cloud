#Cria cluster Kafka no ambiente informado
resource "confluent_kafka_cluster" "basic-cluster" {
  display_name = var.kafka_cluster.display_name # nome do cluster
  availability = var.kafka_cluster.availability # disponibilidade do cluster, podendo ser: SINGLE_ZONE ou MULTI_ZONE
  cloud        = var.kafka_cluster.cloud # nome do provedor cloud, podendo ser: AWS, AZURE ou GCP
  region       = var.kafka_cluster.region # nome da region onde será criado, esse valor depende de qual provedor cloud será escolhido
  basic {} # Informa tipo do cluster, podendo ser: basic{}, standard{} e dedicated{ cku = valor_cku }

  environment {
    id = confluent_environment.test.id #ID do ambiente, aqui está sendo utilizado o ID do ambiente criado via Terraform no script "enviroment.tf"
  }
}
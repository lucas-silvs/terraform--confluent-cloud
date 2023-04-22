# Cria ambiente na Confluent Cloud
resource "confluent_environment" "test" {
  display_name = "teste-enviroment" # nome do ambiente Confluent Cloud
}
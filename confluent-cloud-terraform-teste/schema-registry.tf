# Cria Schema Registry no Enviroment associado
data "confluent_schema_registry_region" "schema_registry-teste" {
  cloud   = var.schema_registry.cloud # nome do provedor cloud, podendo ser: AWS, AZURE ou GCP
  region  = var.schema_registry.region # nome da region onde será criado, esse valor depende de qual provedor cloud será escolhido
  package = var.schema_registry.package # Tipo de auditoria do Schema Registry no ambiente (ESSENTIALS ou ADVANCED)
}

resource "confluent_schema_registry_cluster" "schema-registry-teste" {
  package = var.schema_registry.package # Tipo de auditoria do Schema Registry no ambiente (ESSENTIALS ou ADVANCED)

  environment {
    id = confluent_environment.test.id # Id do ambiente Confluent Cloud
  }
  
  
  region {
    # o código das regiões para o Schema registry são diferentes, conforme a doc: https://docs.confluent.io/cloud/current/stream-governance/packages.html#stream-governance-regions
    id = data.confluent_schema_registry_region.schema_registry-teste.id  # nome da region onde será criado, esse valor depende de qual provedor cloud será escolhido
  }
}
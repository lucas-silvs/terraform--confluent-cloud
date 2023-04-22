# Variaveis de formulários que serão solicitadas para criação de cada recurso
# Incluindo valores defaults para alguns campos.
variable "confluent_credentials" {
    type = object({
        cloud_api_key =  string
        cloud_api_secret = string
    })
}

variable "schema_registry" {
    type = object({
        cloud   = string
        region  = string
        package = string
    })
    default = {
        cloud   = "AWS"
        region  = "us-east-2"
        package = "ESSENTIALS"
    }
  
}

variable "kafka_cluster" {
    type = object({
        display_name = string
        availability = string
        cloud        = string
        region       = string
    })
    default = {
        display_name = "kafka_cluster_teste"
        availability = "SINGLE_ZONE"
        cloud        = "AWS"
        region       = "us-east-2"
    }
  
}

variable "topico" {

    type = object({
    nome = string
    })

}
resource "confluent_role_binding" "rbac-teste" {
  principal   = "User:${confluent_service_account.service-account.id}" #associando role de usuario EnviromentAdmin  ao service account
  role_name   = "EnvironmentAdmin" # Role que será associada 
  crn_pattern = confluent_environment.test.resource_name # nome do resource_name do enviroment Confluent Cloud onde será associado a role
}

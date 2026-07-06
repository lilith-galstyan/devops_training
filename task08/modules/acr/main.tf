resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.acr_sku
  admin_enabled       = true
  tags                = var.tags
}
resource "azurerm_container_registry_task" "acr_build_task" {
  name                  = var.acr_name
  container_registry_id = azurerm_container_registry.acr.id
  platform {
    os = "Linux"
  }
  docker_step {
    dockerfile_path      = "Dockerfile"
    context_path         = "${var.github_repo_url}#main:task08/application"
    context_access_token = var.git_pat
    image_names          = ["${var.image_name}:latest"]
  }
}
resource "azurerm_container_registry_task_schedule_run_now" "acr_build_run_now" {
  container_registry_task_id = azurerm_container_registry_task.acr_build_task.id
}
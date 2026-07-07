resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.acr_sku
  admin_enabled       = true
  tags                = var.tags
}

# Builds the Docker image from the application archive uploaded to the
# Storage Account. context_path is the blob's URL, context_access_token
# is the SAS token that grants ACR read access to that private blob.
resource "azurerm_container_registry_task" "acr_build_task" {
  name                  = var.acr_name
  container_registry_id = azurerm_container_registry.acr.id

  platform {
    os = "Linux"
  }

  docker_step {
    dockerfile_path      = "Dockerfile"
    context_path         = var.blob_url
    context_access_token = var.sas_token
    image_names          = ["${var.image_name}:latest"]
  }
}

resource "azurerm_container_registry_task_schedule_run_now" "acr_build_run_now" {
  container_registry_task_id = azurerm_container_registry_task.acr_build_task.id
}

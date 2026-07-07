# Provider *configuration* (host, credentials) lives in the root module's
# versions.tf, sourced from the aks module's outputs. This module only
# declares the requirement so Terraform doesn't error on undefined
# providers when resources are planned inside this module.
terraform {
  required_providers {
    kubectl = {
      source = "alekc/kubectl"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

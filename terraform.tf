terraform {
  required_version = "~> 1.6"
  required_providers {
    azurerm = "~> 3.88"
  }
  backend "azurerm" {
    resource_group_name  = "rg-cptalz-mgmt-state-germanywestcentral-001"
    storage_account_name = "stocptalzmgmtger001newj"
    container_name       = "mgmt-tfstate"
    key                  = "dev.terraform.tfstate"
    use_azuread_auth     = true
    subscription_id      = "f474dec9-5bab-47a3-b4d3-e641dac87ddb"
    tenant_id            = "0BA83D3D-0644-4916-98C0-D513E10DC917"
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

provider "azurerm" {
  skip_provider_registration = true
  alias                      = "management"
  subscription_id            = var.subscription_id_management
  features {}
}

provider "azurerm" {
  skip_provider_registration = true
  alias                      = "connectivity"
  subscription_id            = var.subscription_id_connectivity
  features {}
}

provider "azurerm" {
  alias           = "identity"
  subscription_id = var.subscription_id_identity
  features {}
}

provider "azurerm" {
  alias           = "lz1"
  subscription_id = "a2c4c615-592b-46a7-b30f-54ccd174bddf"
  features {}
}

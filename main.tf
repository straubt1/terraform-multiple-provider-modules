# Core Subscription Variables
variable "core_ARM_TENANT_ID" {}
variable "core_ARM_SUBSCRIPTION_ID" {}
variable "core_ARM_CLIENT_ID" {}
variable "core_ARM_CLIENT_SECRET" {}

# App Subscription Variables
variable "app_ARM_TENANT_ID" {}
variable "app_ARM_SUBSCRIPTION_ID" {}
variable "app_ARM_CLIENT_ID" {}
variable "app_ARM_CLIENT_SECRET" {}

provider "azurerm" {
  alias           = "core"
  tenant_id       = var.core_ARM_TENANT_ID
  subscription_id = var.core_ARM_SUBSCRIPTION_ID
  client_id       = var.core_ARM_CLIENT_ID
  client_secret   = var.core_ARM_CLIENT_SECRET
  version         = "= 1.37.0"
}

provider "azurerm" {
  alias           = "app"
  tenant_id       = var.app_ARM_TENANT_ID
  subscription_id = var.app_ARM_SUBSCRIPTION_ID
  client_id       = var.app_ARM_CLIENT_ID
  client_secret   = var.app_ARM_CLIENT_SECRET
  version         = "= 1.37.0"
}

module "vm" {
  source = "./vm_windows"

  providers = {
    azurerm.core = azurerm.core
    azurerm.app  = azurerm.app
  }
}

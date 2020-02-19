# If I remove these provider blocks, I get 2 errors like this:
# 
# Error: Provider configuration not present

# To work with module.vm.azurerm_resource_group.app its original provider
# configuration at module.vm.provider.azurerm.app is required, but it has been
# removed. This occurs when a provider configuration is removed while objects
# created by that provider still exist in the state. Re-add the provider
# configuration to destroy module.vm.azurerm_resource_group.app, after which you
# can remove the provider configuration again.
provider "azurerm" {
  alias = "core"
}
provider "azurerm" {
  alias = "app"
}

resource "azurerm_resource_group" "core" {
  provider = azurerm.core
  name     = "core-rg"
  location = "centralus"
}

resource "azurerm_resource_group" "app" {
  provider = azurerm.app
  name     = "app-rg"
  location = "centralus"
}

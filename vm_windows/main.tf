###### Proxy Configuration Provider Blocks ######
provider "azurerm" {
  alias = "core"
}
provider "azurerm" {
  alias = "app"
}
# More information here: https://www.terraform.io/docs/configuration/modules.html#passing-providers-explicitly
# This subdirectory ./vm_windows must then contain "proxy configuration" blocks 
# to declare that it requires configurations to be passed with these from the providers block
# in the parent's module block

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

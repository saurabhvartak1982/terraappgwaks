provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x. 
  # If you are using version 1.x, the "features" block is not allowed.
  version = "~>2.0"
  features {}
}

terraform {
    backend "azurerm" {
      storage_account_name = "<Azure Storage account name>"
      container_name = "<Azure Storage container name>"
      key = "<desired key>"
      access_key = "<Azure Storage account access key>"
  
  }
    
}

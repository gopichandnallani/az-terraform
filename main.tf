terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

#Object ID0: 87f5429d-2a91-49c3-933e-cff6b60ada93

#powershell
# $env:ARM_CLIENT_ID = "e72a74c5-b83e-445d-aee6-e8808eebda98"
# $env:ARM_CLIENT_SECRET = "RlY8Q~5R6sHErVPReh9do-mHJE~-qOnljO3fPcMx"
# $env:ARM_SUBSCRIPTION_ID = "b2aec48f-6dad-4d57-ad25-dad521fe74a4"
# $env:ARM_TENANT_ID = "0d7cc8e9-be54-45cc-b2e3-041a9b45aa57"
# terraform import azurerm_resource_group.example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/group1

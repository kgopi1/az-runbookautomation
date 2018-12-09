provider "azurerm" {

}

terraform {
  backend "azurerm" {
    storage_account_name = "automationsg01"
    container_name       = "terraform"
    key                  = "dev.tfstate"
    access_key = "1sMC8+G7DrOUbME75cxosxNfnmLnTLOnvZcGDWODPf9qzaVlu0mnhCwzUGOAMVVek2h7J8OgCsbtceOb2LKelg=="
  }
}

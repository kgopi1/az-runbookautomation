provider "azurerm" {

}

terraform {
  backend "azurerm" {
    storage_account_name = "automationsg01"
    container_name       = "terraform"
    key                  = "dev.tfstate"
    access_key = "7gp72KO5HP4ZACgDZvqH0HukYhAKmwcYJiPdt74parbPYLo8S5uPR4Fymx6218YqTbZ7B9DXtwXYu2GTRhJSsA=="
  }
}

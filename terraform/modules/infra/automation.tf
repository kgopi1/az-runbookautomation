resource "azurerm_automation_account" "azautomation" {
  name                = "${var.automationacct}"
  location            = "${var.rglocation}"
  resource_group_name = "${var.rgname}"

  sku {
    name = "Basic"
  }
  tags = "${merge(map(
    "Description", "${var.tags["environment"]} AzureAutomation"),
    var.tags
  )}"
  }

module "infra" {
  source = "../../modules/infra"
  rglocation = "${var.rglocation}"
  rgname = "${var.rgname}"
  vnetname = "${var.vnetname}"
  vnetaddress = "${var.vnetaddress}"
  subnetname = "${var.subnetname}"
  subnetrange = "${var.subnetrange}"
  tags = "${var.tags}"
  vmcount = "${var.vmcount}"
  vmhostname = "${var.vmhostname}"
  vmsize = "${var.vmsize}"
  winadmin = "${var.winadmin}"
  winadminpwd = "${var.winadminpwd}"
  ## OS image reference
  publisher = "${var.publisher}"
  offer = "${var.offer}"
  sku = "${var.sku}"
  osversion = "${var.osversion}"

  disksgacct01 = "${var.disksgacct01}"
  ddiskcount = "${var.ddiskcount}"
  automationacct = "${var.automationacct}"
  autosku = "${var.autosku}"

}

variable "vmcount" {
    default = "1"
}

variable "vmhostname" {
  default = "devwin"
}

variable "vmsize" {
  default = "Standard_DS1_v2"
}

variable "winadmin" {
  default = "tcsadmin"
}
variable "winadminpwd" {
  default = ""
}
## OS Image reference details ##
## To get the image rerference use az vm image list -o table ##
variable "publisher" {
  default = "MicrosoftWindowsServer"
}

variable "offer" {
  default = "WindowsServer"
}

variable "sku" {
  default = "2016-Datacenter"
}

variable "osversion" {
  default = "latest"
}

# publisher = "MicrosoftWindowsServer"
# offer     = "WindowsServer"
# sku       = "2016-Datacenter"
# version   = "latest"

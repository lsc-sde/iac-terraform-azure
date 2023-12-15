locals {
  name = var.name != "" ? var.name : "${var.prefix}-vm"
  os_disk_name = "${local.name}-os-disk"
  managed_identity_name = "${local.name}-mi"
  network_interface_name = "${local.name}-nic"
}
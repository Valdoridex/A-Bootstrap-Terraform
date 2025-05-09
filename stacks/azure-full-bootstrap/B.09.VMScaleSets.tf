# TODO: resolve ignored hints

# trunk-ignore-all(checkov/CKV_AZURE_49,checkov/CKV_AZURE_97)

resource "azurerm_linux_virtual_machine_scale_set" "ubuntu-base" {
  name                = "ubuntu-base"
  resource_group_name = azurerm_resource_group.Vdx-DevOps.name
  location            = var.azure-location
  sku                 = "Standard_D2_v4"
  instances           = 0
  admin_username      = "adminuser"
  # upgrade_mode        = "Automatic"
  # automatic_os_upgrade_policy {
  #   enable_automatic_os_upgrade = true
  #   disable_automatic_rollback  = true
  # }
  overprovision = false

  admin_ssh_key {
    username   = "adminuser"
    public_key = file(var.vmss-pub-ssh-key-file)
  }

  encryption_at_host_enabled = false

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "default"
    primary = true
    ip_configuration {
      name      = "default"
      primary   = true
      subnet_id = azurerm_subnet.vdx-internal.id
    }
  }

  tags = local.tags
}
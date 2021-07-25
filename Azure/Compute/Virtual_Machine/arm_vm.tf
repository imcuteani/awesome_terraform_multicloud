# Create Azure Resource Group 

resource "azurerm_resource_group" "example" {
    name = "${var.azure_resource_group_name}"
    location = "${var.azure_resource_group_location}"
  
}

# Create Azure Linux VM 

resource "azurerm_linux_virtual_machine" "example" {
    name  = "${var.azure_virtual_machine_name}"
    resource_group_name = azurerm_resource_group.example.name
    location = azurerm_resource_group.example.location
    size = "Standard_F2"
    admin_username = "adminuser"
    network_interface_ids = ["azurerm_network_interface.example.id",]
    admin_ssh_key {
      username = "adminuser"
      public_key = file("/id_rsa.pub")
    }

    os_disk {
      caching   = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "16.04-LTS"
      version   = "latest"  

    }
  
}
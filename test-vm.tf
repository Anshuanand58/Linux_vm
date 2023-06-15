module "test-vm" {
  source                = "location of your code"
  create_resource_group = false
  resource_group_name   = "test-rg"
  location              = "centralindia"
  managed_disk_name     = "test-vm-osdisk"
  managed_disk_rg       = "test-rg"
  Subnet_name           = "default"
  vnet_rg_name          = "test-rg"
  vnet_name             = "test-vnet"
  create_public_ip      = false
  nic_name              = "test-nic"
  pip_add_allocation    = "Static" #Don't cange
  private_ip_address    = "10.15.40.133"
  existing_data_disk    = true
  dd_config = {
    "dd1" = {
      name                = "test-vm-datadisk-01"
      resource_group_name = "test-rg"
      lun                 = "10" #don't change
      caching             = "None"
      vmkey               = "vm1" #don't change
    }
  }
  vm_config = {
    "vm1" = {
      name          = "test-vm"
      vm_size       = "Standard_E2s_v3"
      stg_acc_type  = "Standard_LRS"
      os_type       = "Linux"
      create_option = "Attach" #don't change
    }
  }
  tags = {
    application        = "test"
  }
}

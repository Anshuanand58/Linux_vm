module "lcidevcicdomn001" {
  source                = "git::https://xkmjl6xcuanap5betn3m43lagh5y6llpn6lq5bqfpaxep7cynvca@dev.azure.com/IRL-INFRA-DEVOPS/IRL-MODULES/_git/IRL-MODULES//azurerm_snapshot_vm"
  create_resource_group = false
  resource_group_name   = "rsg-ci-infra-prd-omn-01"
  location              = "centralindia"
  managed_disk_name     = "lcidevcicdomn001-osdisk"
  managed_disk_rg       = "rsg-ci-infra-prd-omn-01"
  Subnet_name           = "snt-ci-inf-prd-poc-elk-aks-01"
  vnet_rg_name          = "rsg-ci-inf-prd-net-01"
  vnet_name             = "vnt-ci-inf-prd-hub-01"
  create_public_ip      = false
  nic_name              = "nic-ci-ecom-dev-omn-02"
  pip_add_allocation    = "Static" #Don't cange
  private_ip_address    = "10.15.40.133"
  existing_data_disk    = true
  dd_config = {
    "dd1" = {
      name                = "lcidevcicdomn001-datadisk-01"
      resource_group_name = "rsg-ci-infra-prd-omn-01"
      lun                 = "10" #don't change
      caching             = "None"
      vmkey               = "vm1" #don't change
    }
  }
  vm_config = {
    "vm1" = {
      name          = "lcidevcicdomn001"
      vm_size       = "Standard_E2s_v3"
      stg_acc_type  = "Standard_LRS"
      os_type       = "Linux"
      create_option = "Attach" #don't change
    }
  }
  tags = {
    application        = "mPOS-Bastion"
    environment        = "Jump"
    IRL-business-owner = "Mayank Darji"
    tower              = "Omnistore"
  }
}

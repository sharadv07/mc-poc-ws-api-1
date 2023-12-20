# Envionment Variables
######################################################################################################
name             = "iac-wordpress"
location         = "East US 2"
environment_type = "dev"
default_tags = {
  project     = "iac-wordpress"
  environment = "development"
  deployed_by = "terraform"
}


# Web Server and Wordpress Variables
######################################################################################################

number_of_web_servers = 2


wp_title = "IAC Wordpress"

wp_admin_user = "admin"

wp_admin_email = "test@test.com"


# Networking Variables
######################################################################################################

network_trusted_ips = []

vnet_address_space = ["10.0.0.0/24"]


vnet_subnets = {
  virtual_network_subnets_001 = {
    subnet_name                               = "vms"
    address_prefix                            = "10.0.0.0/27"
    private_endpoint_network_policies_enabled = true
    service_endpoints                         = ["Microsoft.Storage"]
    service_delegations                       = {}
  },
  virtual_network_subnets_002 = {
    subnet_name                               = "endpoints"
    address_prefix                            = "10.0.0.32/27"
    private_endpoint_network_policies_enabled = true
    service_endpoints                         = ["Microsoft.Storage"]
    service_delegations                       = {}
  },
  virtual_network_subnets_003 = {
    subnet_name                               = "database"
    address_prefix                            = "10.0.0.64/27"
    private_endpoint_network_policies_enabled = true
    service_endpoints                         = ["Microsoft.Storage"]
    service_delegations = {
      fs = {
        "Microsoft.DBforMySQL/flexibleServers" = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      }
    }
  },
}


subnet_for_vms = "virtual_network_subnets_001"

subnet_for_endpoints = "virtual_network_subnets_002"


subnet_for_database = "virtual_network_subnets_003"


# Storeage Variables
######################################################################################################

sa_account_tier = "Premium"

sa_account_kind = "FileStorage"


sa_account_replication_type = "LRS"

sa_enable_https_traffic_only = false


sa_min_tls_version = "TLS1_2"


sa_network_bypass = [
  "Metrics",
  "Logging",
  "AzureServices",
]


sa_network_default_action = "Deny"


nfs_share_quota = 100


nfs_enbled_protocol = "NFS"


# Database Variables

######################################################################################################

database_administrator_login = "wordpress"


database_backup_retention_days = 7


database_sku_name = "B_Standard_B1ms"

database_zone = 1


databaqse_charset = "utf8"


database_collation = "utf8_general_ci"


# Virtual Machine Variables

######################################################################################################

vm_size = "Standard_B1ms"


vm_image_publisher = "Canonical"


vm_image_offer = "0001-com-ubuntu-server-focal"


vm_image_sku = "20_04-LTS"


vm_image_version = "latest"


vm_admin_username = "adminuser"


vm_admin_ssh_key_path = "~/.ssh/id_rsa.pub"


# Azure Kubernetes Service (AKS) - Secure Baseline
# Architect: Rojohn Hernia
# Focus: RBAC, Azure Policy, Network Restrictions

resource "azurerm_kubernetes_cluster" "secure_aks" {
  name                = "aks-fintech-prod-01"
  location            = "East US"
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-fintech"
  kubernetes_version  = "1.29"

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_D2s_v3"
    
    # Security: Ensure nodes are not exposed publicly
    enable_node_public_ip = false
  }

  # Security: Enable Azure Active Directory Integration (RBAC)
  azure_active_directory_role_based_access_control {
    managed                = true
    azure_rbac_enabled     = true
  }

  # Security: Enforce Network Policies (Calico or Azure)
  network_profile {
    network_plugin    = "azure"
    network_policy    = "calico" 
    load_balancer_sku = "standard"
  }

  # Observability: Enable Container Insights
  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.sec_logs.id
  }
  
  tags = {
    Environment = "Production"
    Compliance  = "SOC2"
  }
}

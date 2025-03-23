data "azurerm_subscription" "current" {}

data "azurerm_log_analytics_workspace" "existing_log_analytics_ws" {
  name                = var.log_analytics_workspace_name
  resource_group_name = var.log_analytics_workspace_rg_name
}

data "template_file" "init" {
  template = "${file("${path.module}/fileboundapi.json")}"
  # vars = {
  #   consul_address = "${aws_instance.consul.private_ip}"
  # }
}
data "azurerm_subscription" "current" {}

# data "template_file" "init" {
#   template = "${file("${path.module}/fileboundapi.json")}"
#   # vars = {
#   #   consul_address = "${aws_instance.consul.private_ip}"
#   # }
# }
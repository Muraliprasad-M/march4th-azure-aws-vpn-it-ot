
# OT Outputs
output "ot_tgw_id" {
  value = module.ot_vpn.tgw_id
}

output "ot_tgw_route_table_id" {
  value = module.ot_vpn.tgw_route_table_id
}

output "ot_tgw_vpc_attachment_id" {
  value = module.ot_vpn.tgw_vpc_attachment_id
}

output "ot_customer_gateways" {
  value = module.ot_vpn.customer_gateways
}

output "ot_vpn_connections" {
  value     = module.ot_vpn.vpn_connections
  sensitive = true
}

# IT Outputs
output "it_tgw_id" {
  value = module.it_vpn.tgw_id
}

output "it_tgw_route_table_id" {
  value = module.it_vpn.tgw_route_table_id
}

output "it_tgw_vpc_attachment_id" {
  value = module.it_vpn.tgw_vpc_attachment_id
}

output "it_customer_gateways" {
  value = module.it_vpn.customer_gateways
}

output "it_vpn_connections" {
  value     = module.it_vpn.vpn_connections
  sensitive = true
}

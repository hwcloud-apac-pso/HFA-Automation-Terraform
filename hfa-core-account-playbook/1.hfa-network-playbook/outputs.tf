output "common_vpc_id" {
  value       = module.common_service_vpc.vpc_id
  description = "Common Account VPC ID"
}

output "security_vpc_id" {
  value       = module.security_service_vpc.vpc_id
  description = "Security Account VPC ID"
}

output "transit_prod_ingress_vpc_id" {
  value       = module.transit_service_prod_ingress_vpc.vpc_id
  description = "Transit Account Ingress VPC ID"
}


output "transit_prod_egress_vpc_id" {
  value       = module.transit_service_prod_egress_vpc.vpc_id
  description = "Transit Account Egress VPC ID"
}

output "transit_nonprod_ingress_vpc_id" {
  value       = module.transit_service_nonprod_ingress_vpc.vpc_id
  description = "Transit Account Ingress VPC ID"
}


output "transit_nonprod_egress_vpc_id" {
  value       = module.transit_service_nonprod_egress_vpc.vpc_id
  description = "Transit Account Egress VPC ID"
}




## for general account
output "transit_egress_nat_gw_id" {
   value = module.transit_service_nonprod_egress_vpc.egress_nat_gw_id
   description = "Transit Account Egress NAT GW ID"
}

output "transit_egress_nat_gw_eip" {
   value = module.transit_service_nonprod_egress_vpc.egress_nat_gw_eip
   description = "Transit Account Egress NAT GW EIP"
}

output "common_requester_vpc_peering_id" {
  value = module.common_service_vpc_2_transit_nonprod_egress_vpc.requester_vpc_peering_id
  description = "Common Account Requester VPC Peering id"
}

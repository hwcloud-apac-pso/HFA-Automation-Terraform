## add snat rule in egress account 
## add default gateway in common service account 


### Sourth-North oubound : Transit Nat GW  - add snat rule for common cidr
resource "huaweicloud_nat_snat_rule" "egress_snat_rule_for_common_service" {
  provider = huaweicloud.transit_service
  nat_gateway_id = module.transit_service_prod_egress_vpc.egress_nat_gw_id
  floating_ip_id = module.transit_service_prod_egress_vpc.egress_nat_gw_eip
  source_type    = 0
  cidr           = var.common_service_vpc_cidr
}




#### South-North outbound Traffic : common --> Transit egress --> internet
resource "huaweicloud_vpc_route" "vpc_route" { 
  provider = huaweicloud.common_service
  vpc_id         = module.common_service_vpc.vpc_id
  destination    = "0.0.0.0/0"
  type           = "peering"
  nexthop        = module.common_service_vpc_2_transit_prod_egress_vpc.requester_vpc_peering_id
}



###  East-West  Traffic : Common -->  Transit NonProd Egress -->  Security
resource "huaweicloud_vpc_route" "common_2_security_route" { 
  provider = huaweicloud.common_service
  vpc_id         = module.common_service_vpc.vpc_id
  destination    = var.security_service_vpc_cidr
  type           = "peering"
  nexthop        = module.common_service_vpc_2_transit_nonprod_egress_vpc.requester_vpc_peering_id
}


### East-West Traffic : Security --> Transit NorProd Egress --> Common
resource "huaweicloud_vpc_route" "security_2_common_route" { 
  provider = huaweicloud.security_service
  vpc_id         = module.security_service_vpc.vpc_id
  destination    = var.common_service_vpc_cidr
  type           = "peering"
  nexthop        = module.security_service_vpc_2_transit_nonprod_egress_vpc.requester_vpc_peering_id
}
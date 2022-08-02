## add snat rule in egress account 


### South-North oubound : Transit Nat GW  - add snat rule for prod cidr
resource "huaweicloud_nat_snat_rule" "egress_snat_rule_for_prod_account" {
  provider = huaweicloud.transit_service
  nat_gateway_id = data.terraform_remote_state.network.outputs.transit_egress_nat_gw_id  
  floating_ip_id = data.terraform_remote_state.network.outputs.transit_egress_nat_gw_eip
  source_type    = 0
  cidr           = var.prod_env_vpc_cidr
}


#### South-North outbound : common --> Transit egress --> internet
resource "huaweicloud_vpc_route" "prod_vpc_route" { 
  provider = huaweicloud.prod_env
  vpc_id         = module.prod_env_vpc.vpc_id
  destination    = "0.0.0.0/0"
  type           = "peering"
  nexthop        = module.prod_env_vpc_2_transit_prod_egress_vpc.requester_vpc_peering_id
}




###  East-West Traffic : Prod  -->   Transit Egress -->  Common

resource "huaweicloud_vpc_route" "prod_2_common_route" { 
  provider = huaweicloud.prod_env
  vpc_id         = module.prod_env_vpc.vpc_id
  destination    = var.common_service_vpc_cidr
  type           = "peering"
  nexthop        = module.prod_env_vpc_2_transit_prod_egress_vpc.requester_vpc_peering_id
}

### East-West Traffic : Common  -->   Transit Egress -->  Prod
##                      
resource "huaweicloud_vpc_route" "common_2_prod_route" { 
  provider = huaweicloud.common_service
  vpc_id         = data.terraform_remote_state.network.outputs.common_vpc_id
  destination    = var.prod_env_vpc_cidr
  type           = "peering"
  nexthop        = data.terraform_remote_state.network.outputs.common_requester_vpc_peering_id
}
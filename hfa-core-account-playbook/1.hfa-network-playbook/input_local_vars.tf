## for common Service
variable common_service_vpc { default = "common_service_vpc" }
variable common_service_vpc_cidr { default = "10.16.0.0/16" }
variable common_private_subnet_cidr { default = "10.16.0.0/22" }
variable common_cce_subnet_cidr { default = "10.16.4.0/22" }
variable common_database_subnet_cidr { default = "10.16.10.0/24" }

## for security Service
variable security_service_vpc { default = "security_service_vpc" }
variable security_service_vpc_cidr { default = "10.17.0.0/16" }
variable security_private_subnet_cidr { default = "10.17.0.0/20" }

## for transit service  prod
variable transit_service_prod_ingress_vpc { default = "transit_prod_ingress_vpc" }
variable transit_prod_ingress_vpc_cidr { default = "10.18.0.0/16" }
variable transit_prod_ingress_subnet_cidr { default = "10.18.0.0/20" }

variable transit_service_prod_egress_vpc { default = "transit_prod_egress_vpc" }
variable transit_prod_egress_vpc_cidr { default = "10.19.0.0/16" }
variable transit_prod_egress_subnet_cidr  { default = "10.19.0.0/20" }
variable transit_prod_egress_nat_gw_name  { default = "egress_prod_nat_gw" }


### for non-prod
variable transit_service_nonprod_ingress_vpc { default = "transit_nonprod_ingress_vpc" }
variable transit_nonprod_ingress_vpc_cidr { default = "10.20.0.0/16" }
variable transit_nonprod_ingress_subnet_cidr { default = "10.20.0.0/20" }

variable transit_service_nonprod_egress_vpc { default = "transit_nonprod_egress_vpc" }
variable transit_nonprod_egress_vpc_cidr { default = "10.21.0.0/16" }
variable transit_nonprod_egress_subnet_cidr  { default = "10.21.0.0/20" }
variable transit_nonprod_egress_nat_gw_name  { default = "egress_nonprod_nat_gw" }




## for peerping , get from "My Credentials"--> "API Credentials" --> "projects" --> "project id/region"
## for this , can't get it from data source, only in console
# variable common_iam_region_project_id  { default = "6d0d9837d70f4df98850fcd7da905822" }
# variable security_iam_region_project_id  { default = "c87e73e0d0ff48229614ec96d6f1b03d" }
# variable prod_iam_region_project_id  { default = "d4ed0bd83ec04045af3372bd51e70379" }

variable transit_iam_region_project_id  { default = "461b0097661c4e248d8a472da57ae958" }

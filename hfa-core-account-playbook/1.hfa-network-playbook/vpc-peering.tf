module "common_service_vpc_2_transit_prod_ingress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpcpeering-multi-account"
  peering_region = module.global_variables.default_region

  requester_access_key = module.global_variables.common_service_account_ak
  requester_secret_key = module.global_variables.common_service_account_sk
  requester_vpc_name = var.common_service_vpc
  requester_vpc_id = module.common_service_vpc.vpc_id
  requester_vpc_cidr = var.common_service_vpc_cidr

  accepter_access_key = module.global_variables.transit_service_account_ak
  accepter_secret_key = module.global_variables.transit_service_account_sk
  accepter_vpc_name = var.transit_service_prod_ingress_vpc
  accepter_vpc_id = module.transit_service_prod_ingress_vpc.vpc_id
  accepter_vpc_cidr = var.transit_prod_ingress_vpc_cidr
  accepter_iam_region_project_id = var.transit_iam_region_project_id
}

module "common_service_vpc_2_transit_prod_egress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpcpeering-multi-account"
  peering_region = module.global_variables.default_region

  requester_access_key = module.global_variables.common_service_account_ak
  requester_secret_key = module.global_variables.common_service_account_sk
  requester_vpc_name = var.common_service_vpc
  requester_vpc_id = module.common_service_vpc.vpc_id
  requester_vpc_cidr = var.common_service_vpc_cidr

  accepter_access_key = module.global_variables.transit_service_account_ak
  accepter_secret_key = module.global_variables.transit_service_account_sk
  accepter_vpc_name = var.transit_service_prod_egress_vpc
  accepter_vpc_id = module.transit_service_prod_egress_vpc.vpc_id
  accepter_vpc_cidr = var.transit_prod_egress_vpc_cidr
  accepter_iam_region_project_id = var.transit_iam_region_project_id
}

module "common_service_vpc_2_transit_nonprod_ingress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpcpeering-multi-account"
  peering_region = module.global_variables.default_region

  requester_access_key = module.global_variables.common_service_account_ak
  requester_secret_key = module.global_variables.common_service_account_sk
  requester_vpc_name = var.common_service_vpc
  requester_vpc_id = module.common_service_vpc.vpc_id
  requester_vpc_cidr = var.common_service_vpc_cidr

  accepter_access_key = module.global_variables.transit_service_account_ak
  accepter_secret_key = module.global_variables.transit_service_account_sk
  accepter_vpc_name = var.transit_service_nonprod_ingress_vpc
  accepter_vpc_id = module.transit_service_nonprod_ingress_vpc.vpc_id
  accepter_vpc_cidr = var.transit_nonprod_ingress_vpc_cidr
  accepter_iam_region_project_id = var.transit_iam_region_project_id
}

module "common_service_vpc_2_transit_nonprod_egress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpcpeering-multi-account"
  peering_region = module.global_variables.default_region

  requester_access_key = module.global_variables.common_service_account_ak
  requester_secret_key = module.global_variables.common_service_account_sk
  requester_vpc_name = var.common_service_vpc
  requester_vpc_id = module.common_service_vpc.vpc_id
  requester_vpc_cidr = var.common_service_vpc_cidr

  accepter_access_key = module.global_variables.transit_service_account_ak
  accepter_secret_key = module.global_variables.transit_service_account_sk
  accepter_vpc_name = var.transit_service_nonprod_egress_vpc
  accepter_vpc_id = module.transit_service_nonprod_egress_vpc.vpc_id
  accepter_vpc_cidr = var.transit_nonprod_egress_vpc_cidr
  accepter_iam_region_project_id = var.transit_iam_region_project_id
}



module "security_service_vpc_2_transit_prod_ingress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpcpeering-multi-account"
  peering_region = module.global_variables.default_region

  requester_access_key = module.global_variables.security_service_account_ak
  requester_secret_key = module.global_variables.security_service_account_sk
  requester_vpc_name = var.security_service_vpc
  requester_vpc_id = module.security_service_vpc.vpc_id
  requester_vpc_cidr = var.security_service_vpc_cidr

  accepter_access_key = module.global_variables.transit_service_account_ak
  accepter_secret_key = module.global_variables.transit_service_account_sk
  accepter_vpc_name = var.transit_service_prod_ingress_vpc
  accepter_vpc_id = module.transit_service_prod_ingress_vpc.vpc_id
  accepter_vpc_cidr = var.transit_prod_ingress_vpc_cidr
  accepter_iam_region_project_id = var.transit_iam_region_project_id
}

module "security_service_vpc_2_transit_prod_egress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpcpeering-multi-account"
  peering_region = module.global_variables.default_region

  requester_access_key = module.global_variables.security_service_account_ak
  requester_secret_key = module.global_variables.security_service_account_sk
  requester_vpc_name = var.security_service_vpc
  requester_vpc_id = module.security_service_vpc.vpc_id
  requester_vpc_cidr = var.security_service_vpc_cidr

  accepter_access_key = module.global_variables.transit_service_account_ak
  accepter_secret_key = module.global_variables.transit_service_account_sk
  accepter_vpc_name = var.transit_service_prod_egress_vpc
  accepter_vpc_id = module.transit_service_prod_egress_vpc.vpc_id
  accepter_vpc_cidr = var.transit_prod_egress_vpc_cidr
  accepter_iam_region_project_id = var.transit_iam_region_project_id
}


module "security_service_vpc_2_transit_nonprod_ingress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpcpeering-multi-account"
  peering_region = module.global_variables.default_region

  requester_access_key = module.global_variables.security_service_account_ak
  requester_secret_key = module.global_variables.security_service_account_sk
  requester_vpc_name = var.security_service_vpc
  requester_vpc_id = module.security_service_vpc.vpc_id
  requester_vpc_cidr = var.security_service_vpc_cidr

  accepter_access_key = module.global_variables.transit_service_account_ak
  accepter_secret_key = module.global_variables.transit_service_account_sk
  accepter_vpc_name = var.transit_service_nonprod_ingress_vpc
  accepter_vpc_id = module.transit_service_nonprod_ingress_vpc.vpc_id
  accepter_vpc_cidr = var.transit_nonprod_ingress_vpc_cidr
  accepter_iam_region_project_id = var.transit_iam_region_project_id
}

module "security_service_vpc_2_transit_nonprod_egress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpcpeering-multi-account"
  peering_region = module.global_variables.default_region

  requester_access_key = module.global_variables.security_service_account_ak
  requester_secret_key = module.global_variables.security_service_account_sk
  requester_vpc_name = var.security_service_vpc
  requester_vpc_id = module.security_service_vpc.vpc_id
  requester_vpc_cidr = var.security_service_vpc_cidr

  accepter_access_key = module.global_variables.transit_service_account_ak
  accepter_secret_key = module.global_variables.transit_service_account_sk
  accepter_vpc_name = var.transit_service_nonprod_egress_vpc
  accepter_vpc_id = module.transit_service_nonprod_egress_vpc.vpc_id
  accepter_vpc_cidr = var.transit_nonprod_egress_vpc_cidr
  accepter_iam_region_project_id = var.transit_iam_region_project_id
}


module "prod_env_vpc_2_transit_prod_ingress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpcpeering-multi-account"
  peering_region = module.global_variables.default_region

  requester_access_key = module.global_variables.prod_env_account_ak
  requester_secret_key = module.global_variables.prod_env_account_sk
  requester_vpc_name = var.prod_env_vpc
  requester_vpc_id = module.prod_env_vpc.vpc_id
  requester_vpc_cidr = var.prod_env_vpc_cidr

  accepter_access_key = module.global_variables.transit_service_account_ak
  accepter_secret_key = module.global_variables.transit_service_account_sk
  accepter_vpc_name = var.transit_service_prod_ingress_vpc
  accepter_vpc_id = data.terraform_remote_state.network.outputs.transit_prod_ingress_vpc_id
  accepter_vpc_cidr = var.transit_prod_ingress_vpc_cidr
  accepter_iam_region_project_id = var.transit_iam_region_project_id
}

module "prod_env_vpc_2_transit_prod_egress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpcpeering-multi-account"
  peering_region = module.global_variables.default_region

  requester_access_key = module.global_variables.prod_env_account_ak
  requester_secret_key = module.global_variables.prod_env_account_sk
  requester_vpc_name = var.prod_env_vpc
  requester_vpc_id = module.prod_env_vpc.vpc_id
  requester_vpc_cidr = var.prod_env_vpc_cidr

  accepter_access_key = module.global_variables.transit_service_account_ak
  accepter_secret_key = module.global_variables.transit_service_account_sk
  accepter_vpc_name = var.transit_service_prod_egress_vpc
  accepter_vpc_id = data.terraform_remote_state.network.outputs.transit_prod_egress_vpc_id
  accepter_vpc_cidr = var.transit_prod_egress_vpc_cidr
  accepter_iam_region_project_id = var.transit_iam_region_project_id
}

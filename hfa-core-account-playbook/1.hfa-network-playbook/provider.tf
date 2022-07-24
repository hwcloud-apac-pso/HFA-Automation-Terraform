terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "~> 1.37.1"
    }
  }
}



provider "huaweicloud" {
  # alias not support variable
  alias      = "common_service"
  region     = module.global_variables.default_region
  access_key = module.global_variables.common_service_account_ak
  secret_key = module.global_variables.common_service_account_sk
}


provider "huaweicloud" {
  alias      = "security_service"
  region     = module.global_variables.default_region
  access_key = module.global_variables.security_service_account_ak
  secret_key = module.global_variables.security_service_account_sk
}


provider "huaweicloud" {
  alias      = "transit_service"
  region     = module.global_variables.default_region
  access_key = module.global_variables.transit_service_account_ak
  secret_key = module.global_variables.transit_service_account_sk
}




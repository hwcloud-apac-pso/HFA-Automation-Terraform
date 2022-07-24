module "common_service_cts_notify" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-cts-notification"
  providers = {
    huaweicloud = huaweicloud.common_service
  }
  root_account_name = module.global_variables.common_service_root_account_name  
  cts_important_notify_email = var.cts_notify_email
#   cts_important_notify_phone = var.cts_notify_phone
}


module "security_service_cts_notify" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-cts-notification"
  providers = {
    huaweicloud = huaweicloud.security_service
  }

  root_account_name = module.global_variables.security_service_root_account_name 
  cts_important_notify_email = var.cts_notify_email
#   cts_important_notify_phone = var.cts_notify_phone
}

module "transit_service_cts_notify" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-cts-notification"
  providers = {
    huaweicloud = huaweicloud.transit_service
  }

  root_account_name = module.global_variables.transit_service_root_account_name  
  cts_important_notify_email = var.cts_notify_email
#   cts_important_notify_phone = var.cts_notify_phone
}
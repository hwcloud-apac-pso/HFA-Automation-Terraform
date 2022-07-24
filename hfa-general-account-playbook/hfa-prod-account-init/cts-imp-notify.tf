module "prod_env_cts_notify" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-cts-notification"
  providers = {
    huaweicloud = huaweicloud.prod_env
  }
  
  root_account_name = module.global_variables.prod_env_root_account_name
  cts_important_notify_email = var.cts_notify_email
#   cts_important_notify_phone = var.cts_notify_phone
}
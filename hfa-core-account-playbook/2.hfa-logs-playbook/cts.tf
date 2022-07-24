module "common_service_cts" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-cts-local" 
  cts_local_rotation_day = var.cts_local_rotation_day
  #cts_switch = false
  providers = {
    huaweicloud = huaweicloud.common_service
  }
}

# module "security_service_cts" {
#   source = "../../terraform-hwcloud-modules/terraform-hwcloud-cts-local" 
#   cts_local_rotation_day = var.cts_local_rotation_day
#   providers = {
#     huaweicloud = huaweicloud.security_service
#   }
# }

# module "transit_service_cts" {
#   source = "../../terraform-hwcloud-modules/terraform-hwcloud-cts-local" 
#   cts_local_rotation_day = var.cts_local_rotation_day
#   providers = {
#     huaweicloud = huaweicloud.transit_service
#   }
# }

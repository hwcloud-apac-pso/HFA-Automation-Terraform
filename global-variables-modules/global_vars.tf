output "corp_name" { value = "hwcloud_intl_corp" }
output "corp-name" { value = "hwcloud-intl-corp" }



#### for default region singapore
output "default_region" { value = "ap-southeast-3" }


# AK/SK common Services/share Services/ops ,  transit , security/audit account 
output "common_service_account_name"   { value = "common_service" }
output "common_service_root_account_name"   { value = "Change me" }
output "common_service_account_ak"   { value = "Change me" }
output "common_service_account_sk"   { value = "Change me" }

# security / Audit  account
output "security_service_account_name"   { value = "security_service" }
output "security_service_root_account_name"   { value = "Change me" }
output "security_service_account_ak"   { value = "Change me" }
output "security_service_account_sk"   { value = "Change me" }

# transit account
output "transit_service_account_name"   { value = "transit_service" }
output "transit_service_root_account_name"   { value = "Change me" }
output "transit_service_account_ak"   { value = "Change me" }
output "transit_service_account_sk"   { value = "Change me" }


# for General account
# prod env account
output "prod_env_account_name"   { value = "prod_env" }
output "prod_env_root_account_name"   { value = "Change me" }
output "prod_env_account_ak"   { value = "Change me" }
output "prod_env_account_sk"   { value = "Change me" }


resource "huaweicloud_identity_agency" "agency" {
  provider = huaweicloud.collected
  name                  = "cts_agency_centralized_for_${var.centralized_account_name}"
  delegated_domain_name = var.centralized_account_name

  project_role {
    project = var.region
    roles   = ["LTS FullAccess"]
  }
#   domain_roles = ["LTS FullAccess",]  
}


resource "random_string" "random" {
  length           = 8
  special          = false
  upper            = false
}


# resource "huaweicloud_kms_key" "kms" {
#   provider = huaweicloud.centralized
#   key_alias       = "cts-centralized-obs"
#   pending_days    = "30"
#   is_enabled      = true
# }

resource "huaweicloud_obs_bucket" "cts_centralized_bucket" {
  provider = huaweicloud.centralized
  bucket = "cts-centralized-bucket-${replace(var.collected_account_name,"_","-")}-${random_string.random.result}"
  acl    = "private"
  multi_az = true
  encryption = true 
  force_destroy = true
  versioning = true
  lifecycle_rule {
    name = "cts_rotation"
    enabled = true
    expiration {
        days = var.cts_centralized_rotation_days
    }
  }
}

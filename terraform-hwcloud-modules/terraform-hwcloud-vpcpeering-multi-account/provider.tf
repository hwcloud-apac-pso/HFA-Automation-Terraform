provider "huaweicloud" {
  alias                   = "requester"
  region                  = var.peering_region
  access_key = var.requester_access_key
  secret_key = var.requester_secret_key
  cloud                   = tostring(try(var.requester_cloud_endpoint, null))
  security_token          = tostring(try(var.requester_sts, null))
}

provider "huaweicloud" {
  alias                   = "accepter"
  region                  = var.peering_region
  access_key = var.accepter_access_key
  secret_key = var.accepter_secret_key
  cloud                   = tostring(try(var.accepter_cloud_endpoint, null))
  security_token          = tostring(try(var.accepter_sts, null))
}


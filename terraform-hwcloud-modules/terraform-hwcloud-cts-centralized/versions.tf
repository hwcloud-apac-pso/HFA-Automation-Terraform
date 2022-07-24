terraform { 
  required_version = ">= 1.1.9"
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "~> 1.37.1"
    }
  }
}
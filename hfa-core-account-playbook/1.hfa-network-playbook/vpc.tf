module "common_service_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpc"
  
  name = "${var.common_service_vpc}"
  vpc_cidr = var.common_service_vpc_cidr
  private_subnet_cidr = var.common_private_subnet_cidr
  database_subnet_cidr = var.common_database_subnet_cidr
  cce_subnet_cidr = var.common_cce_subnet_cidr

  providers = {
    huaweicloud = huaweicloud.common_service
  }
}

module "security_service_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpc"
  
  name = "${var.security_service_vpc}"
  vpc_cidr = var.security_service_vpc_cidr
  private_subnet_cidr = var.security_private_subnet_cidr

  providers = {
    huaweicloud = huaweicloud.security_service
  }
}



module "transit_service_prod_ingress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpc"
  
  name = "${var.transit_service_prod_ingress_vpc}"
  vpc_cidr = var.transit_prod_ingress_vpc_cidr
  ingress_subnet_cidr = var.transit_prod_ingress_subnet_cidr

  providers = {
    huaweicloud = huaweicloud.transit_service
  }
}

module "transit_service_prod_egress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpc"
  
  name = "${var.transit_service_prod_egress_vpc}"
  vpc_cidr = var.transit_prod_egress_vpc_cidr
  egress_subnet_cidr = var.transit_prod_egress_subnet_cidr

  providers = {
    huaweicloud = huaweicloud.transit_service
  }
}


module "transit_service_nonprod_ingress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpc"
  
  name = "${var.transit_service_nonprod_ingress_vpc}"
  vpc_cidr = var.transit_nonprod_ingress_vpc_cidr
  ingress_subnet_cidr = var.transit_nonprod_ingress_subnet_cidr

  providers = {
    huaweicloud = huaweicloud.transit_service
  }
}

module "transit_service_nonprod_egress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpc"
  
  name = "${var.transit_service_nonprod_egress_vpc}"
  vpc_cidr = var.transit_nonprod_egress_vpc_cidr
  egress_subnet_cidr = var.transit_nonprod_egress_subnet_cidr

  providers = {
    huaweicloud = huaweicloud.transit_service
  }
}
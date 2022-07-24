module "prod_env_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpc"
  
  name = var.prod_env_vpc
  vpc_cidr = var.prod_env_vpc_cidr
  
  private_subnet_cidr = var.prod_private_subnet_cidr
  cce_subnet_cidr = var.prod_cce_subnet_cidr
  database_subnet_cidr = var.prod_database_subnet_cidr


  providers = {
    huaweicloud = huaweicloud.prod_env
  }
}

# Huawei Cloud VPC Terraform module

Terraform module which creates VPC resources on Huawei Cloud.


## Usage

```hcl
module "vpc" {
  source = "terraform-hwcloud-modules/terraform-hwcloud-vpc"
  
  name = "my-vpc"
  vpc_cidr = "10.0.0.0/16"
  private_subnet_cidr = "10.0.0.0/22"
  cce_subnet_cidr = "10.0.4.0/22"
  database_subnet_cidr = "10.0.10.0/24"


  tags = {
    Terraform = "true"
    AccountType = "Core"
  }

}

```






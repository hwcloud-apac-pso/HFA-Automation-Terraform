# Huawei Cloud VPC Peering Terraform module

Terraform module which creates VPC Peering resources on Huawei Cloud.


## Usage

```hcl
module "vpc_peering" {
  source = "terraform-hwcloud-modules/terraform-hwcloud-vpcpeering"
  peering_region = "ap-southeast-3"

  requester_access_key = "your_requester_account_ak"
  requester_secret_key = "your_requester_account_ak"
  requester_vpc_name = "your_requester_vpc_alias_name"
  requester_vpc_id = "your_requester_vpc_id"
  requester_vpc_cidr = "your_requester_vpc_cidr"

  accepter_access_key = "your_accepter_account_ak"
  accepter_secret_key = "your_accepter_account_sk"
  accepter_vpc_name = "your_accepter_vpc_alias_name"
  accepter_vpc_id = "your_accepter_vpc_id"
  accepter_vpc_cidr = "your_accepter_vpc_cidr"
  accepter_iam_region_project_id = "your_accepter_region_project_id"
}


```
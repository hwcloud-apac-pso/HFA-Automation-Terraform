resource "huaweicloud_vpc" "default" {
  name = var.name
  cidr = var.vpc_cidr

  tags = merge(
    { "Name" = var.name },
    var.tags,
  )

}

resource "huaweicloud_vpc_subnet" "public_subnet" {
  count =  length(var.public_subnet_cidr) > 0  ? 1 : 0
  name       = var.public_subnet_name
  cidr       = var.public_subnet_cidr
  gateway_ip = cidrhost(var.public_subnet_cidr, 1)

  primary_dns   = var.primary_dns
  secondary_dns = var.secondary_dns
  vpc_id        = huaweicloud_vpc.default.id

  tags = merge(
    { "Name" = var.public_subnet_name },
    var.tags,
  )
}

resource "huaweicloud_vpc_subnet" "private_subnet" {
  count =  length(var.private_subnet_cidr) > 0 ? 1 : 0
  name       = var.private_subnet_name
  cidr       = var.private_subnet_cidr
  gateway_ip = cidrhost(var.private_subnet_cidr, 1)

  primary_dns   = var.primary_dns
  secondary_dns = var.secondary_dns
  vpc_id        = huaweicloud_vpc.default.id

  tags = merge(
    { "Name" = var.private_subnet_name },
    var.tags,
  )
}

resource "huaweicloud_vpc_subnet" "database_subnet" {
  count =  length(var.database_subnet_cidr) > 0 ? 1 : 0
  name       = var.database_subnet_name
  cidr       = var.database_subnet_cidr
  gateway_ip = cidrhost(var.database_subnet_cidr, 1)

  primary_dns   = var.primary_dns
  secondary_dns = var.secondary_dns
  vpc_id        = huaweicloud_vpc.default.id

  tags = merge(
    { "Name" = var.database_subnet_name },
    var.tags,
  )
}

resource "huaweicloud_vpc_subnet" "cce_subnet" {
  count =  length(var.cce_subnet_cidr) > 0  ? 1 : 0  
  name       = var.cce_subnet_name
  cidr       = var.cce_subnet_cidr
  gateway_ip = cidrhost(var.cce_subnet_cidr, 1)

  primary_dns   = var.primary_dns
  secondary_dns = var.secondary_dns
  vpc_id        = huaweicloud_vpc.default.id

  tags = merge(
    { "Name" = var.cce_subnet_name },
    var.tags,
  )
}

resource "huaweicloud_vpc_subnet" "ingress_subnet" {
  count =  length(var.ingress_subnet_cidr) > 0 ? 1 : 0 
  name       = var.ingress_subnet_name
  cidr       = var.ingress_subnet_cidr
  gateway_ip = cidrhost(var.ingress_subnet_cidr, 1)

  primary_dns   = var.primary_dns
  secondary_dns = var.secondary_dns
  vpc_id        = huaweicloud_vpc.default.id

  tags = merge(
    { "Name" = var.ingress_subnet_name },
    var.tags,
  )
}


resource "huaweicloud_vpc_subnet" "egress_subnet" {
  count =  length(var.egress_subnet_cidr) > 0 ? 1 : 0
  name       = var.egress_subnet_name
  cidr       = var.egress_subnet_cidr
  gateway_ip = cidrhost(var.egress_subnet_cidr, 1)

  primary_dns   = var.primary_dns
  secondary_dns = var.secondary_dns
  vpc_id        = huaweicloud_vpc.default.id

  tags = merge(
    { "Name" = var.egress_subnet_name },
    var.tags,
  )
}



######

resource "huaweicloud_nat_gateway" "egress_nat" {
  count =   length(var.egress_subnet_cidr) > 0 && length(var.egress_nat_gw_name) > 0 ? 1 : 0
  name        = var.egress_nat_gw_name
  spec        = "3"
  vpc_id      = huaweicloud_vpc.default.id
  subnet_id   = huaweicloud_vpc_subnet.egress_subnet[0].id
  depends_on = [
    huaweicloud_vpc_subnet.egress_subnet,
  ]
}

resource "huaweicloud_vpc_eip" "nat_eip" {
  count =   length(var.egress_subnet_cidr) > 0 && length(var.egress_nat_gw_name) > 0 ? 1 : 0
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name        = "eip_bandwith_5G"
    size        = 8
    share_type  = "PER"
    charge_mode = "traffic"
  }
}


resource "huaweicloud_nat_snat_rule" "egress_snat_rule" {
  count =   length(var.egress_subnet_cidr) > 0 && length(var.egress_nat_gw_name) > 0 ? 1 : 0
  nat_gateway_id = huaweicloud_nat_gateway.egress_nat[0].id
  floating_ip_id = huaweicloud_vpc_eip.nat_eip[0].id
  source_type    = 0
  cidr           = var.egress_subnet_cidr
  depends_on = [
    huaweicloud_nat_gateway.egress_nat,
  ]
}

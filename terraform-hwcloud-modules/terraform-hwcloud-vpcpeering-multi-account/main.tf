resource "huaweicloud_vpc_peering_connection" "requester" {
  provider       = huaweicloud.requester
  name           = "${var.requester_vpc_name}_peering_${var.accepter_vpc_name}"
  vpc_id         = var.requester_vpc_id
  peer_vpc_id    = var.accepter_vpc_id
  peer_tenant_id = var.accepter_iam_region_project_id
}

# Accepter's side of the connection.
resource "huaweicloud_vpc_peering_connection_accepter" "accepter" {
  provider = huaweicloud.accepter
  accept   = true
  vpc_peering_connection_id = huaweicloud_vpc_peering_connection.requester.id
}




resource "huaweicloud_vpc_route" "requester_route" {
  provider       = huaweicloud.requester
  vpc_id         = var.requester_vpc_id
  destination    = var.accepter_vpc_cidr
  type           = "peering"
  nexthop        = huaweicloud_vpc_peering_connection.requester.id
  depends_on = [
    huaweicloud_vpc_peering_connection_accepter.accepter,
  ]
}


resource "huaweicloud_vpc_route" "accepter_route" {
  provider       = huaweicloud.accepter
  vpc_id         = var.accepter_vpc_id
  destination    = var.requester_vpc_cidr
  type           = "peering"
  nexthop        = huaweicloud_vpc_peering_connection_accepter.accepter.id
  depends_on = [
    huaweicloud_vpc_peering_connection_accepter.accepter,
  ]
}

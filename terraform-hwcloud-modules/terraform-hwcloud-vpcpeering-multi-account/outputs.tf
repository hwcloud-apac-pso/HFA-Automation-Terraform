output "requester_vpc_peering_id" {
  value       = huaweicloud_vpc_peering_connection.requester.id
  description = "Requester VPC Peering ID"
}

output "accepter_vpc_peering_id" {
  value       = huaweicloud_vpc_peering_connection_accepter.accepter.id
  description = "Accpeter VPC Peering ID"
}
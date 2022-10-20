output "kind_endpoint" {
  value = kind_cluster.default.endpoint
}

output "kind_client_certificate" {
  value = kind_cluster.default.client_certificate
}

output "kind_ca_certificate" {
  value = kind_cluster.default.cluster_ca_certificate
}

output "kind_client_key" {
  value = kind_cluster.default.client_key
}

# Output variable definitions

output "msg_vpn" {
  value     = try(solacebroker_msg_vpn.main, null)
  sensitive = true
}

output "acl_profile" {
  value = try(solacebroker_msg_vpn_acl_profile.main, null)
}

output "client_profile" {
  value = try(solacebroker_msg_vpn_client_profile.main, null)
}

output "oauth_profile" {
  value     = try(solacebroker_msg_vpn_authentication_oauth_profile.main, null)
  sensitive = true
}

output "oauth_profile_client_required_claims" {
  value = try(solacebroker_msg_vpn_authentication_oauth_profile_client_required_claim.main, null)
}

output "oauth_profile_resource_server_required_claims" {
  value = try(solacebroker_msg_vpn_authentication_oauth_profile_resource_server_required_claim.main, null)
}

output "cert_matching_rule" {
  value = try(solacebroker_msg_vpn_cert_matching_rule.main, null)
}

output "cert_matching_rule_conditions" {
  value = try(solacebroker_msg_vpn_cert_matching_rule_condition.main, null)
}

output "cert_matching_rule_attribute_filters" {
  value = try(solacebroker_msg_vpn_cert_matching_rule_attribute_filter.main, null)
}

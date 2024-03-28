locals {
  oauth_profile_client_required_claims_list          = tolist(var.oauth_profile_client_required_claims)
  oauth_profile_resource_server_required_claims_list = tolist(var.oauth_profile_resource_server_required_claims)
  cert_matching_rule_conditions_list                 = tolist(var.cert_matching_rule_conditions)
  cert_matching_rule_attribute_filters_list          = tolist(var.cert_matching_rule_attribute_filters)
}

resource "solacebroker_msg_vpn" "main" {
  msg_vpn_name                                                  = var.msg_vpn_name
  authentication_basic_type                                     = var.authentication_basic_type
  dmr_enabled                                                   = var.dmr_enabled
  enabled                                                       = var.enabled
  jndi_enabled                                                  = var.jndi_enabled
  max_msg_spool_usage                                           = var.max_msg_spool_usage
  authentication_oauth_enabled                                  = var.oauth_profile_name != "" ? true : var.authentication_oauth_enabled
  authentication_oauth_default_profile_name                     = var.oauth_profile_name != "" ? var.oauth_profile_name : var.authentication_oauth_default_profile_name
  authentication_client_cert_enabled                            = var.cert_matching_rule_name != "" ? true : var.authentication_client_cert_enabled
  authentication_client_cert_certificate_matching_rules_enabled = var.cert_matching_rule_name != "" ? true : var.authentication_client_cert_certificate_matching_rules_enabled

  #AutoAddAttributes #EnableCommonVariables
}

resource "solacebroker_msg_vpn_client_profile" "default" {
  count = solacebroker_msg_vpn.main.msg_vpn_name != "default" ? 1 : 0

  msg_vpn_name                             = solacebroker_msg_vpn.main.msg_vpn_name
  client_profile_name                      = "default"
  allow_guaranteed_endpoint_create_enabled = true
  allow_guaranteed_msg_send_enabled        = true
  allow_guaranteed_msg_receive_enabled     = true
  allow_shared_subscriptions_enabled       = true
  allow_bridge_connections_enabled         = true
  allow_transacted_sessions_enabled        = true
}

resource "solacebroker_msg_vpn_acl_profile" "main" {
  count = var.acl_profile_name != "" ? 1 : 0

  msg_vpn_name     = solacebroker_msg_vpn.main.msg_vpn_name
  acl_profile_name = var.acl_profile_name

  #AutoAddAttributes #EnableCommonVariables
}

resource "solacebroker_msg_vpn_client_profile" "main" {
  count = var.client_profile_name != "" ? 1 : 0

  msg_vpn_name        = solacebroker_msg_vpn.main.msg_vpn_name
  client_profile_name = var.client_profile_name

  #AutoAddAttributes #EnableCommonVariables
}

resource "solacebroker_msg_vpn_authentication_oauth_profile" "main" {
  count = var.oauth_profile_name != "" ? 1 : 0

  msg_vpn_name       = solacebroker_msg_vpn.main.msg_vpn_name
  oauth_profile_name = var.oauth_profile_name
  enabled            = var.enabled

  #AutoAddAttributes #EnableCommonVariables
}

resource "solacebroker_msg_vpn_authentication_oauth_profile_client_required_claim" "main" {
  count = var.oauth_profile_name != "" ? length(local.oauth_profile_client_required_claims_list) : 0

  msg_vpn_name                = solacebroker_msg_vpn.main.msg_vpn_name
  oauth_profile_name          = solacebroker_msg_vpn_authentication_oauth_profile.main[0].oauth_profile_name
  client_required_claim_name  = local.oauth_profile_client_required_claims_list[count.index].claim_name
  client_required_claim_value = local.oauth_profile_client_required_claims_list[count.index].claim_value
}

resource "solacebroker_msg_vpn_authentication_oauth_profile_resource_server_required_claim" "main" {
  count = var.oauth_profile_name != "" ? length(local.oauth_profile_resource_server_required_claims_list) : 0

  msg_vpn_name                         = solacebroker_msg_vpn.main.msg_vpn_name
  oauth_profile_name                   = solacebroker_msg_vpn_authentication_oauth_profile.main[0].oauth_profile_name
  resource_server_required_claim_name  = local.oauth_profile_resource_server_required_claims_list[count.index].claim_name
  resource_server_required_claim_value = local.oauth_profile_resource_server_required_claims_list[count.index].claim_value
}

resource "solacebroker_msg_vpn_cert_matching_rule" "main" {
  count = var.cert_matching_rule_name != "" ? 1 : 0

  msg_vpn_name = solacebroker_msg_vpn.main.msg_vpn_name
  rule_name    = var.cert_matching_rule_name
  enabled      = var.enabled
}

resource "solacebroker_msg_vpn_cert_matching_rule_condition" "main" {
  count = var.cert_matching_rule_name != "" ? length(local.cert_matching_rule_conditions_list) : 0

  msg_vpn_name = solacebroker_msg_vpn.main.msg_vpn_name
  rule_name    = solacebroker_msg_vpn_cert_matching_rule.main[0].rule_name
  source       = local.cert_matching_rule_conditions_list[count.index].source
  expression   = local.cert_matching_rule_conditions_list[count.index].expression
}

resource "solacebroker_msg_vpn_cert_matching_rule_attribute_filter" "main" {
  count = var.cert_matching_rule_name != "" ? length(local.cert_matching_rule_attribute_filters_list) : 0

  msg_vpn_name    = solacebroker_msg_vpn.main.msg_vpn_name
  rule_name       = solacebroker_msg_vpn_cert_matching_rule.main[0].rule_name
  filter_name     = local.cert_matching_rule_attribute_filters_list[count.index].filter_name
  attribute_name  = local.cert_matching_rule_attribute_filters_list[count.index].attribute_name
  attribute_value = local.cert_matching_rule_attribute_filters_list[count.index].attribute_value
}








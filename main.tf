# Copyright 2024 Solace Corporation. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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

  alias                                                          = var.alias
  authentication_basic_enabled                                   = var.authentication_basic_enabled
  authentication_basic_profile_name                              = var.authentication_basic_profile_name
  authentication_basic_radius_domain                             = var.authentication_basic_radius_domain
  authentication_client_cert_allow_api_provided_username_enabled = var.authentication_client_cert_allow_api_provided_username_enabled
  authentication_client_cert_max_chain_depth                     = var.authentication_client_cert_max_chain_depth
  authentication_client_cert_revocation_check_mode               = var.authentication_client_cert_revocation_check_mode
  authentication_client_cert_username_source                     = var.authentication_client_cert_username_source
  authentication_client_cert_validate_date_enabled               = var.authentication_client_cert_validate_date_enabled
  authentication_kerberos_allow_api_provided_username_enabled    = var.authentication_kerberos_allow_api_provided_username_enabled
  authentication_kerberos_enabled                                = var.authentication_kerberos_enabled
  authorization_ldap_group_membership_attribute_name             = var.authorization_ldap_group_membership_attribute_name
  authorization_ldap_trim_client_username_domain_enabled         = var.authorization_ldap_trim_client_username_domain_enabled
  authorization_profile_name                                     = var.authorization_profile_name
  authorization_type                                             = var.authorization_type
  bridging_tls_server_cert_max_chain_depth                       = var.bridging_tls_server_cert_max_chain_depth
  bridging_tls_server_cert_validate_date_enabled                 = var.bridging_tls_server_cert_validate_date_enabled
  bridging_tls_server_cert_validate_name_enabled                 = var.bridging_tls_server_cert_validate_name_enabled
  event_connection_count_threshold                               = var.event_connection_count_threshold
  event_egress_flow_count_threshold                              = var.event_egress_flow_count_threshold
  event_egress_msg_rate_threshold                                = var.event_egress_msg_rate_threshold
  event_endpoint_count_threshold                                 = var.event_endpoint_count_threshold
  event_ingress_flow_count_threshold                             = var.event_ingress_flow_count_threshold
  event_ingress_msg_rate_threshold                               = var.event_ingress_msg_rate_threshold
  event_large_msg_threshold                                      = var.event_large_msg_threshold
  event_log_tag                                                  = var.event_log_tag
  event_msg_spool_usage_threshold                                = var.event_msg_spool_usage_threshold
  event_publish_client_enabled                                   = var.event_publish_client_enabled
  event_publish_msg_vpn_enabled                                  = var.event_publish_msg_vpn_enabled
  event_publish_subscription_mode                                = var.event_publish_subscription_mode
  event_publish_topic_format_mqtt_enabled                        = var.event_publish_topic_format_mqtt_enabled
  event_publish_topic_format_smf_enabled                         = var.event_publish_topic_format_smf_enabled
  event_service_amqp_connection_count_threshold                  = var.event_service_amqp_connection_count_threshold
  event_service_mqtt_connection_count_threshold                  = var.event_service_mqtt_connection_count_threshold
  event_service_rest_incoming_connection_count_threshold         = var.event_service_rest_incoming_connection_count_threshold
  event_service_smf_connection_count_threshold                   = var.event_service_smf_connection_count_threshold
  event_service_web_connection_count_threshold                   = var.event_service_web_connection_count_threshold
  event_subscription_count_threshold                             = var.event_subscription_count_threshold
  event_transacted_session_count_threshold                       = var.event_transacted_session_count_threshold
  event_transaction_count_threshold                              = var.event_transaction_count_threshold
  export_subscriptions_enabled                                   = var.export_subscriptions_enabled
  max_connection_count                                           = var.max_connection_count
  max_egress_flow_count                                          = var.max_egress_flow_count
  max_endpoint_count                                             = var.max_endpoint_count
  max_ingress_flow_count                                         = var.max_ingress_flow_count
  max_subscription_count                                         = var.max_subscription_count
  max_transacted_session_count                                   = var.max_transacted_session_count
  max_transaction_count                                          = var.max_transaction_count
  mqtt_retain_max_memory                                         = var.mqtt_retain_max_memory
  replication_ack_propagation_interval_msg_count                 = var.replication_ack_propagation_interval_msg_count
  replication_bridge_authentication_basic_client_username        = var.replication_bridge_authentication_basic_client_username
  replication_bridge_authentication_basic_password               = var.replication_bridge_authentication_basic_password
  replication_bridge_authentication_client_cert_content          = var.replication_bridge_authentication_client_cert_content
  replication_bridge_authentication_client_cert_password         = var.replication_bridge_authentication_client_cert_password
  replication_bridge_authentication_scheme                       = var.replication_bridge_authentication_scheme
  replication_bridge_compressed_data_enabled                     = var.replication_bridge_compressed_data_enabled
  replication_bridge_egress_flow_window_size                     = var.replication_bridge_egress_flow_window_size
  replication_bridge_retry_delay                                 = var.replication_bridge_retry_delay
  replication_bridge_tls_enabled                                 = var.replication_bridge_tls_enabled
  replication_bridge_unidirectional_client_profile_name          = var.replication_bridge_unidirectional_client_profile_name
  replication_enabled                                            = var.replication_enabled
  replication_enabled_queue_behavior                             = var.replication_enabled_queue_behavior
  replication_queue_max_msg_spool_usage                          = var.replication_queue_max_msg_spool_usage
  replication_queue_reject_msg_to_sender_on_discard_enabled      = var.replication_queue_reject_msg_to_sender_on_discard_enabled
  replication_reject_msg_when_sync_ineligible_enabled            = var.replication_reject_msg_when_sync_ineligible_enabled
  replication_role                                               = var.replication_role
  replication_transaction_mode                                   = var.replication_transaction_mode
  rest_tls_server_cert_max_chain_depth                           = var.rest_tls_server_cert_max_chain_depth
  rest_tls_server_cert_validate_date_enabled                     = var.rest_tls_server_cert_validate_date_enabled
  rest_tls_server_cert_validate_name_enabled                     = var.rest_tls_server_cert_validate_name_enabled
  semp_over_msg_bus_admin_client_enabled                         = var.semp_over_msg_bus_admin_client_enabled
  semp_over_msg_bus_admin_distributed_cache_enabled              = var.semp_over_msg_bus_admin_distributed_cache_enabled
  semp_over_msg_bus_admin_enabled                                = var.semp_over_msg_bus_admin_enabled
  semp_over_msg_bus_enabled                                      = var.semp_over_msg_bus_enabled
  semp_over_msg_bus_legacy_show_clear_enabled                    = var.semp_over_msg_bus_legacy_show_clear_enabled
  semp_over_msg_bus_show_enabled                                 = var.semp_over_msg_bus_show_enabled
  service_amqp_max_connection_count                              = var.service_amqp_max_connection_count
  service_amqp_plain_text_enabled                                = var.service_amqp_plain_text_enabled
  service_amqp_plain_text_listen_port                            = var.service_amqp_plain_text_listen_port
  service_amqp_tls_enabled                                       = var.service_amqp_tls_enabled
  service_amqp_tls_listen_port                                   = var.service_amqp_tls_listen_port
  service_mqtt_authentication_client_cert_request                = var.service_mqtt_authentication_client_cert_request
  service_mqtt_max_connection_count                              = var.service_mqtt_max_connection_count
  service_mqtt_plain_text_enabled                                = var.service_mqtt_plain_text_enabled
  service_mqtt_plain_text_listen_port                            = var.service_mqtt_plain_text_listen_port
  service_mqtt_tls_enabled                                       = var.service_mqtt_tls_enabled
  service_mqtt_tls_listen_port                                   = var.service_mqtt_tls_listen_port
  service_mqtt_tls_web_socket_enabled                            = var.service_mqtt_tls_web_socket_enabled
  service_mqtt_tls_web_socket_listen_port                        = var.service_mqtt_tls_web_socket_listen_port
  service_mqtt_web_socket_enabled                                = var.service_mqtt_web_socket_enabled
  service_mqtt_web_socket_listen_port                            = var.service_mqtt_web_socket_listen_port
  service_rest_incoming_authentication_client_cert_request       = var.service_rest_incoming_authentication_client_cert_request
  service_rest_incoming_authorization_header_handling            = var.service_rest_incoming_authorization_header_handling
  service_rest_incoming_max_connection_count                     = var.service_rest_incoming_max_connection_count
  service_rest_incoming_plain_text_enabled                       = var.service_rest_incoming_plain_text_enabled
  service_rest_incoming_plain_text_listen_port                   = var.service_rest_incoming_plain_text_listen_port
  service_rest_incoming_tls_enabled                              = var.service_rest_incoming_tls_enabled
  service_rest_incoming_tls_listen_port                          = var.service_rest_incoming_tls_listen_port
  service_rest_mode                                              = var.service_rest_mode
  service_rest_outgoing_max_connection_count                     = var.service_rest_outgoing_max_connection_count
  service_smf_max_connection_count                               = var.service_smf_max_connection_count
  service_smf_plain_text_enabled                                 = var.service_smf_plain_text_enabled
  service_smf_tls_enabled                                        = var.service_smf_tls_enabled
  service_web_authentication_client_cert_request                 = var.service_web_authentication_client_cert_request
  service_web_max_connection_count                               = var.service_web_max_connection_count
  service_web_plain_text_enabled                                 = var.service_web_plain_text_enabled
  service_web_tls_enabled                                        = var.service_web_tls_enabled
  tls_allow_downgrade_to_plain_text_enabled                      = var.tls_allow_downgrade_to_plain_text_enabled
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

  client_connect_default_action       = var.client_connect_default_action
  publish_topic_default_action        = var.publish_topic_default_action
  subscribe_share_name_default_action = var.subscribe_share_name_default_action
  subscribe_topic_default_action      = var.subscribe_topic_default_action
}

resource "solacebroker_msg_vpn_client_profile" "main" {
  count = var.client_profile_name != "" ? 1 : 0

  msg_vpn_name        = solacebroker_msg_vpn.main.msg_vpn_name
  client_profile_name = var.client_profile_name

  allow_bridge_connections_enabled                                 = var.allow_bridge_connections_enabled
  allow_guaranteed_endpoint_create_durability                      = var.allow_guaranteed_endpoint_create_durability
  allow_guaranteed_endpoint_create_enabled                         = var.allow_guaranteed_endpoint_create_enabled
  allow_guaranteed_msg_receive_enabled                             = var.allow_guaranteed_msg_receive_enabled
  allow_guaranteed_msg_send_enabled                                = var.allow_guaranteed_msg_send_enabled
  allow_shared_subscriptions_enabled                               = var.allow_shared_subscriptions_enabled
  allow_transacted_sessions_enabled                                = var.allow_transacted_sessions_enabled
  api_queue_management_copy_from_on_create_template_name           = var.api_queue_management_copy_from_on_create_template_name
  api_topic_endpoint_management_copy_from_on_create_template_name  = var.api_topic_endpoint_management_copy_from_on_create_template_name
  compression_enabled                                              = var.compression_enabled
  eliding_delay                                                    = var.eliding_delay
  eliding_enabled                                                  = var.eliding_enabled
  eliding_max_topic_count                                          = var.eliding_max_topic_count
  event_client_provisioned_endpoint_spool_usage_threshold          = var.event_client_provisioned_endpoint_spool_usage_threshold
  event_connection_count_per_client_username_threshold             = var.event_connection_count_per_client_username_threshold
  event_egress_flow_count_threshold                                = var.event_egress_flow_count_threshold
  event_endpoint_count_per_client_username_threshold               = var.event_endpoint_count_per_client_username_threshold
  event_ingress_flow_count_threshold                               = var.event_ingress_flow_count_threshold
  event_service_smf_connection_count_per_client_username_threshold = var.event_service_smf_connection_count_per_client_username_threshold
  event_service_web_connection_count_per_client_username_threshold = var.event_service_web_connection_count_per_client_username_threshold
  event_subscription_count_threshold                               = var.event_subscription_count_threshold
  event_transacted_session_count_threshold                         = var.event_transacted_session_count_threshold
  event_transaction_count_threshold                                = var.event_transaction_count_threshold
  max_connection_count_per_client_username                         = var.max_connection_count_per_client_username
  max_egress_flow_count                                            = var.max_egress_flow_count
  max_endpoint_count_per_client_username                           = var.max_endpoint_count_per_client_username
  max_ingress_flow_count                                           = var.max_ingress_flow_count
  max_msgs_per_transaction                                         = var.max_msgs_per_transaction
  max_subscription_count                                           = var.max_subscription_count
  max_transacted_session_count                                     = var.max_transacted_session_count
  max_transaction_count                                            = var.max_transaction_count
  queue_control1_max_depth                                         = var.queue_control1_max_depth
  queue_control1_min_msg_burst                                     = var.queue_control1_min_msg_burst
  queue_direct1_max_depth                                          = var.queue_direct1_max_depth
  queue_direct1_min_msg_burst                                      = var.queue_direct1_min_msg_burst
  queue_direct2_max_depth                                          = var.queue_direct2_max_depth
  queue_direct2_min_msg_burst                                      = var.queue_direct2_min_msg_burst
  queue_direct3_max_depth                                          = var.queue_direct3_max_depth
  queue_direct3_min_msg_burst                                      = var.queue_direct3_min_msg_burst
  queue_guaranteed1_max_depth                                      = var.queue_guaranteed1_max_depth
  queue_guaranteed1_min_msg_burst                                  = var.queue_guaranteed1_min_msg_burst
  reject_msg_to_sender_on_no_subscription_match_enabled            = var.reject_msg_to_sender_on_no_subscription_match_enabled
  replication_allow_client_connect_when_standby_enabled            = var.replication_allow_client_connect_when_standby_enabled
  service_min_keepalive_timeout                                    = var.service_min_keepalive_timeout
  service_smf_max_connection_count_per_client_username             = var.service_smf_max_connection_count_per_client_username
  service_smf_min_keepalive_enabled                                = var.service_smf_min_keepalive_enabled
  service_web_inactive_timeout                                     = var.service_web_inactive_timeout
  service_web_max_connection_count_per_client_username             = var.service_web_max_connection_count_per_client_username
  service_web_max_payload                                          = var.service_web_max_payload
  tcp_congestion_window_size                                       = var.tcp_congestion_window_size
  tcp_keepalive_count                                              = var.tcp_keepalive_count
  tcp_keepalive_idle_time                                          = var.tcp_keepalive_idle_time
  tcp_keepalive_interval                                           = var.tcp_keepalive_interval
  tcp_max_segment_size                                             = var.tcp_max_segment_size
  tcp_max_window_size                                              = var.tcp_max_window_size
  tls_allow_downgrade_to_plain_text_enabled                        = var.tls_allow_downgrade_to_plain_text_enabled
}

resource "solacebroker_msg_vpn_authentication_oauth_profile" "main" {
  count = var.oauth_profile_name != "" ? 1 : 0

  msg_vpn_name       = solacebroker_msg_vpn.main.msg_vpn_name
  oauth_profile_name = var.oauth_profile_name
  enabled            = var.enabled

  authorization_groups_claim_name            = var.authorization_groups_claim_name
  authorization_groups_claim_string_format   = var.authorization_groups_claim_string_format
  client_id                                  = var.client_id
  client_required_type                       = var.client_required_type
  client_secret                              = var.client_secret
  client_validate_type_enabled               = var.client_validate_type_enabled
  disconnect_on_token_expiration_enabled     = var.disconnect_on_token_expiration_enabled
  endpoint_discovery                         = var.endpoint_discovery
  endpoint_discovery_refresh_interval        = var.endpoint_discovery_refresh_interval
  endpoint_introspection                     = var.endpoint_introspection
  endpoint_introspection_timeout             = var.endpoint_introspection_timeout
  endpoint_jwks                              = var.endpoint_jwks
  endpoint_jwks_refresh_interval             = var.endpoint_jwks_refresh_interval
  endpoint_userinfo                          = var.endpoint_userinfo
  endpoint_userinfo_timeout                  = var.endpoint_userinfo_timeout
  issuer                                     = var.issuer
  mqtt_username_validate_enabled             = var.mqtt_username_validate_enabled
  oauth_role                                 = var.oauth_role
  resource_server_parse_access_token_enabled = var.resource_server_parse_access_token_enabled
  resource_server_required_audience          = var.resource_server_required_audience
  resource_server_required_issuer            = var.resource_server_required_issuer
  resource_server_required_scope             = var.resource_server_required_scope
  resource_server_required_type              = var.resource_server_required_type
  resource_server_validate_audience_enabled  = var.resource_server_validate_audience_enabled
  resource_server_validate_issuer_enabled    = var.resource_server_validate_issuer_enabled
  resource_server_validate_scope_enabled     = var.resource_server_validate_scope_enabled
  resource_server_validate_type_enabled      = var.resource_server_validate_type_enabled
  username_claim_name                        = var.username_claim_name
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









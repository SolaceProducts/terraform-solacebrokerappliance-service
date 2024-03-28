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

# Input variable definitions

# Required variables

variable "msg_vpn_name" {
  description = "The name of the Message VPN"
  type        = string
}

# Optional variables

variable "authentication_basic_type" {
  description = "The type of basic authentication for clients connecting to the Message VPN. Default is internal"
  type        = string
  default     = "internal"
}

variable "dmr_enabled" {
  description = "Enable or disable Dynamic Message Routing (DMR) for the Message VPN. Default is enabled"
  type        = bool
  default     = true
}

variable "enabled" {
  description = "Enable or disable the Message VPN and underlying created objects. Default is enabled"
  type        = bool
  default     = true
}

variable "jndi_enabled" {
  description = "Enable or disable JNDI access for clients in the Message VPN"
  type        = bool
  default     = true
}

variable "max_msg_spool_usage" {
  description = "The maximum message spool usage by the Message VPN, in megabytes"
  type        = number
  default     = 1500
}

variable "acl_profile_name" {
  description = "The name of the ACL Profile to be created and added to the Message VPN. If not specified, no ACL Profile will be added. Default is \"\""
  type        = string
  default     = ""
}

variable "client_profile_name" {
  description = "The name of the Client Profile to be created and added to the Message VPN. If not specified, no Client Profile will be added. Default is \"\""
  type        = string
  default     = ""
}

variable "oauth_profile_name" {
  description = "The name of the OAuth Profile to be created and added to the Message VPN. If not specified, no OAuth Profile will be added. If specified, OAUth will be enabled on the VPN and this profile will be set as the default profile. Default is \"\""
  type        = string
  default     = ""
}

variable "authentication_oauth_enabled" {
  description = "Enable or disable OAuth authentication"
  type        = bool
  default     = null
}

variable "cert_matching_rule_name" {
  description = "The name of the Certification Matching Rule to be created and added to the Message VPN. A Cert Matching Rule is a collection of conditions and attribute filters that all have to be satisfied for certificate to be acceptable as authentication for a given username. If not specified, no Cert Matching Rule will be added. Default is \"\""
  type        = string
  default     = ""
}

variable "authentication_client_cert_enabled" {
  description = "Enable or disable client certificate authentication in the Message VPN"
  type        = bool
  default     = null
}

variable "authentication_client_cert_certificate_matching_rules_enabled" {
  description = "Enable or disable certificate matching rules"
  type        = bool
  default     = null
}

variable "authentication_oauth_default_profile_name" {
  description = "The name of the profile to use when the client does not supply a profile name"
  type        = string
  default     = null
}

variable "oauth_profile_client_required_claims" {
  description = "Additional claims to be verified in the ID token. Ignored if `oauth_profile_name` is not set"
  type = set(object({
    claim_name  = string
    claim_value = string
  }))
  default = []
}

variable "oauth_profile_resource_server_required_claims" {
  description = "Additional claims to be verified in the access token. Ignored if `oauth_profile_name` is not set"
  type = set(object({
    claim_name  = string
    claim_value = string
  }))
  default = []
}

variable "cert_matching_rule_conditions" {
  description = "The conditions to be added to the Certification Matching Rule. Ignored if `cert_matching_rule_name` is not set"
  type = set(object({
    source     = string
    expression = string
  }))
  default = []
}

variable "cert_matching_rule_attribute_filters" {
  description = "The filters to be added to the Certification Matching Rule. A Cert Matching Rule Attribute Filter compares a username attribute to a string. Ignored if `cert_matching_rule_name` is not set"
  type = set(object({
    filter_name     = string
    attribute_name  = string
    attribute_value = string
  }))
  default = []
}

variable "alias" {
  description = "The name of another Message VPN which this Message VPN is an alias for"
  type        = string
  default     = null
}

variable "allow_bridge_connections_enabled" {
  description = "Enable or disable allowing Bridge clients using the Client Profile to connect"
  type        = bool
  default     = null
}

variable "allow_guaranteed_endpoint_create_durability" {
  description = "The types of Queues and Topic Endpoints that clients using the client-profile can create"
  type        = string
  default     = null
}

variable "allow_guaranteed_endpoint_create_enabled" {
  description = "Enable or disable allowing clients using the Client Profile to create topic endpoints or queues"
  type        = bool
  default     = null
}

variable "allow_guaranteed_msg_receive_enabled" {
  description = "Enable or disable allowing clients using the Client Profile to receive guaranteed messages"
  type        = bool
  default     = null
}

variable "allow_guaranteed_msg_send_enabled" {
  description = "Enable or disable allowing clients using the Client Profile to send guaranteed messages"
  type        = bool
  default     = null
}

variable "allow_shared_subscriptions_enabled" {
  description = "Enable or disable allowing shared subscriptions"
  type        = bool
  default     = null
}

variable "allow_transacted_sessions_enabled" {
  description = "Enable or disable allowing clients using the Client Profile to establish transacted sessions"
  type        = bool
  default     = null
}

variable "api_queue_management_copy_from_on_create_template_name" {
  description = "The name of a queue template to copy settings from when a new queue is created by a client using the Client Profile"
  type        = string
  default     = null
}

variable "api_topic_endpoint_management_copy_from_on_create_template_name" {
  description = "The name of a topic endpoint template to copy settings from when a new topic endpoint is created by a client using the Client Profile"
  type        = string
  default     = null
}

variable "authentication_basic_enabled" {
  description = "Enable or disable basic authentication for clients connecting to the Message VPN"
  type        = bool
  default     = null
}

variable "authentication_basic_profile_name" {
  description = "The name of the RADIUS or LDAP Profile to use for basic authentication"
  type        = string
  default     = null
}

variable "authentication_basic_radius_domain" {
  description = "The RADIUS domain to use for basic authentication"
  type        = string
  default     = null
}

variable "authentication_client_cert_allow_api_provided_username_enabled" {
  description = "Enable or disable allowing a client to specify a Client Username via the API connect method"
  type        = bool
  default     = null
}

variable "authentication_client_cert_max_chain_depth" {
  description = "The maximum depth for a client certificate chain"
  type        = number
  default     = null
}

variable "authentication_client_cert_revocation_check_mode" {
  description = "The desired behavior for client certificate revocation checking"
  type        = string
  default     = null
}

variable "authentication_client_cert_username_source" {
  description = "The field from the client certificate to use as the client username"
  type        = string
  default     = null
}

variable "authentication_client_cert_validate_date_enabled" {
  description = "Enable or disable validation of the \"Not Before\" and \"Not After\" validity dates in the client certificate"
  type        = bool
  default     = null
}

variable "authentication_kerberos_allow_api_provided_username_enabled" {
  description = "Enable or disable allowing a client to specify a Client Username via the API connect method"
  type        = bool
  default     = null
}

variable "authentication_kerberos_enabled" {
  description = "Enable or disable Kerberos authentication in the Message VPN"
  type        = bool
  default     = null
}

variable "authorization_groups_claim_name" {
  description = "The name of the groups claim"
  type        = string
  default     = null
}

variable "authorization_groups_claim_string_format" {
  description = "The format of the authorization groups claim value when it is a string"
  type        = string
  default     = null
}

variable "authorization_ldap_group_membership_attribute_name" {
  description = "The name of the attribute that is retrieved from the LDAP server as part of the LDAP search when authorizing a client connecting to the Message VPN"
  type        = string
  default     = null
}

variable "authorization_ldap_trim_client_username_domain_enabled" {
  description = "Enable or disable client-username domain trimming for LDAP lookups of client connections"
  type        = bool
  default     = null
}

variable "authorization_profile_name" {
  description = "The name of the LDAP Profile to use for client authorization"
  type        = string
  default     = null
}

variable "authorization_type" {
  description = "The type of authorization to use for clients connecting to the Message VPN"
  type        = string
  default     = null
}

variable "bridging_tls_server_cert_max_chain_depth" {
  description = "The maximum depth for a server certificate chain"
  type        = number
  default     = null
}

variable "bridging_tls_server_cert_validate_date_enabled" {
  description = "Enable or disable validation of the \"Not Before\" and \"Not After\" validity dates in the server certificate"
  type        = bool
  default     = null
}

variable "bridging_tls_server_cert_validate_name_enabled" {
  description = "Enable or disable the standard TLS authentication mechanism of verifying the name used to connect to the bridge"
  type        = bool
  default     = null
}

variable "client_connect_default_action" {
  description = "The default action to take when a client using the ACL Profile connects to the Message VPN"
  type        = string
  default     = null
}

variable "client_id" {
  description = "The OAuth client id"
  type        = string
  default     = null
}

variable "client_required_type" {
  description = "The required value for the TYP field in the ID token header"
  type        = string
  default     = null
}

variable "client_secret" {
  description = "The OAuth client secret"
  type        = string
  default     = null
  sensitive   = true
}

variable "client_validate_type_enabled" {
  description = "Enable or disable verification of the TYP field in the ID token header"
  type        = bool
  default     = null
}

variable "compression_enabled" {
  description = "Enable or disable allowing clients using the Client Profile to use compression"
  type        = bool
  default     = null
}

variable "disconnect_on_token_expiration_enabled" {
  description = "Enable or disable the disconnection of clients when their tokens expire"
  type        = bool
  default     = null
}

variable "eliding_delay" {
  description = "The amount of time to delay the delivery of messages to clients using the Client Profile after the initial message has been delivered (the eliding delay interval), in milliseconds"
  type        = number
  default     = null
}

variable "eliding_enabled" {
  description = "Enable or disable message eliding for clients using the Client Profile"
  type        = bool
  default     = null
}

variable "eliding_max_topic_count" {
  description = "The maximum number of topics tracked for message eliding per client connection using the Client Profile"
  type        = number
  default     = null
}

variable "endpoint_discovery" {
  description = "The OpenID Connect discovery endpoint or OAuth Authorization Server Metadata endpoint"
  type        = string
  default     = null
}

variable "endpoint_discovery_refresh_interval" {
  description = "The number of seconds between discovery endpoint requests"
  type        = number
  default     = null
}

variable "endpoint_introspection" {
  description = "The OAuth introspection endpoint"
  type        = string
  default     = null
}

variable "endpoint_introspection_timeout" {
  description = "The maximum time in seconds a token introspection request is allowed to take"
  type        = number
  default     = null
}

variable "endpoint_jwks" {
  description = "The OAuth JWKS endpoint"
  type        = string
  default     = null
}

variable "endpoint_jwks_refresh_interval" {
  description = "The number of seconds between JWKS endpoint requests"
  type        = number
  default     = null
}

variable "endpoint_userinfo" {
  description = "The OpenID Connect Userinfo endpoint"
  type        = string
  default     = null
}

variable "endpoint_userinfo_timeout" {
  description = "The maximum time in seconds a userinfo request is allowed to take"
  type        = number
  default     = null
}

variable "event_client_provisioned_endpoint_spool_usage_threshold" {
  description = "The thresholds for the message spool usage event of Queues and Topic Endpoints provisioned by clients, relative to `max_msg_spool_usage` for these Queues and Topic Endpoints"
  type = object({
    set_percent   = optional(number)
    clear_percent = optional(number)
  })
  default = null
}

variable "event_connection_count_per_client_username_threshold" {
  description = "The thresholds for the Client Username connection count event of the Client Profile, relative to `max_connection_count_per_client_username`"
  type = object({
    set_percent   = optional(number)
    clear_percent = optional(number)
    set_value     = optional(number)
    clear_value   = optional(number)
  })
  default = null
}

variable "event_connection_count_threshold" {
  description = "The thresholds for the client connection count event of the Message VPN, relative to `max_connection_count`"
  type = object({
    set_percent   = optional(number)
    clear_percent = optional(number)
    set_value     = optional(number)
    clear_value   = optional(number)
  })
  default = null
}

variable "event_egress_flow_count_threshold" {
  description = "The thresholds for the egress flow count event of the Message VPN, relative to `max_egress_flow_count`"
  type = object({
    set_percent   = optional(number)
    clear_percent = optional(number)
    set_value     = optional(number)
    clear_value   = optional(number)
  })
  default = null
}

variable "event_egress_msg_rate_threshold" {
  description = "The thresholds for the egress message rate event of the Message VPN"
  type = object({
    set_value   = optional(number)
    clear_value = optional(number)
  })
  default = null
}

variable "event_endpoint_count_per_client_username_threshold" {
  description = "The thresholds for the Client Username endpoint count event of the Client Profile, relative to `max_endpoint_count_per_client_username`"
  type = object({
    set_percent   = optional(number)
    clear_percent = optional(number)
    set_value     = optional(number)
    clear_value   = optional(number)
  })
  default = null
}

variable "event_endpoint_count_threshold" {
  description = "The thresholds for the Queues and Topic Endpoints count event of the Message VPN, relative to `max_endpoint_count`"
  type = object({
    set_percent   = optional(number)
    clear_percent = optional(number)
    set_value     = optional(number)
    clear_value   = optional(number)
  })
  default = null
}

variable "event_ingress_flow_count_threshold" {
  description = "The thresholds for the receive flow count event of the Message VPN, relative to `max_ingress_flow_count`"
  type = object({
    set_percent   = optional(number)
    clear_percent = optional(number)
    set_value     = optional(number)
    clear_value   = optional(number)
  })
  default = null
}

variable "event_ingress_msg_rate_threshold" {
  description = "The thresholds for the receive message rate event of the Message VPN"
  type = object({
    set_value   = optional(number)
    clear_value = optional(number)
  })
  default = null
}

variable "event_large_msg_threshold" {
  description = "The threshold, in kilobytes, after which a message is considered to be large for the Message VPN"
  type        = number
  default     = null
}

variable "event_log_tag" {
  description = "A prefix applied to all published Events in the Message VPN"
  type        = string
  default     = null
}

variable "event_msg_spool_usage_threshold" {
  description = "The thresholds for the message spool usage event of the Message VPN, relative to `max_msg_spool_usage`"
  type = object({
    set_percent   = optional(number)
    clear_percent = optional(number)
    set_value     = optional(number)
    clear_value   = optional(number)
  })
  default = null
}

variable "event_publish_client_enabled" {
  description = "Enable or disable Client level Event message publishing"
  type        = bool
  default     = null
}

variable "event_publish_msg_vpn_enabled" {
  description = "Enable or disable Message VPN level Event message publishing"
  type        = bool
  default     = null
}

variable "event_publish_subscription_mode" {
  description = "Subscription level Event message publishing mode"
  type        = string
  default     = null
}

variable "event_publish_topic_format_mqtt_enabled" {
  description = "Enable or disable Event publish topics in MQTT format"
  type        = bool
  default     = null
}

variable "event_publish_topic_format_smf_enabled" {
  description = "Enable or disable Event publish topics in SMF format"
  type        = bool
  default     = null
}

variable "event_service_amqp_connection_count_threshold" {
  description = "The thresholds for the AMQP client connection count event of the Message VPN, relative to `service_amqp_max_connection_count`"
  type = object({
    set_percent   = optional(number)
    clear_percent = optional(number)
    set_value     = optional(number)
    clear_value   = optional(number)
  })
  default = null
}

variable "event_service_mqtt_connection_count_threshold" {
  description = "The thresholds for the MQTT client connection count event of the Message VPN, relative to `service_mqtt_max_connection_count`"
  type = object({
    set_percent   = optional(number)
    clear_percent = optional(number)
    set_value     = optional(number)
    clear_value   = optional(number)
  })
  default = null
}

variable "event_service_rest_incoming_connection_count_threshold" {
  description = "The thresholds for the incoming REST client connection count event of the Message VPN, relative to `service_rest_incoming_max_connection_count`"
  type = object({
    set_percent   = optional(number)
    clear_percent = optional(number)
    set_value     = optional(number)
    clear_value   = optional(number)
  })
  default = null
}

variable "event_service_smf_connection_count_per_client_username_threshold" {
  description = "The thresholds for the client username SMF connection count event of the Client Profile, relative to `service_smf_max_connection_count_per_client_username`"
  type = object({
    set_percent   = optional(number)
    clear_percent = optional(number)
    set_value     = optional(number)
    clear_value   = optional(number)
  })
  default = null
}

variable "event_service_smf_connection_count_threshold" {
  description = "The thresholds for the SMF client connection count event of the Message VPN, relative to `service_smf_max_connection_count`"
  type = object({
    set_percent   = optional(number)
    clear_percent = optional(number)
    set_value     = optional(number)
    clear_value   = optional(number)
  })
  default = null
}

variable "event_service_web_connection_count_per_client_username_threshold" {
  description = "The thresholds for the Client Username Web Transport connection count event of the Client Profile, relative to `service_web_max_connection_count_per_client_username`"
  type = object({
    set_percent   = optional(number)
    clear_percent = optional(number)
    set_value     = optional(number)
    clear_value   = optional(number)
  })
  default = null
}

variable "event_service_web_connection_count_threshold" {
  description = "The thresholds for the Web Transport client connection count event of the Message VPN, relative to `service_web_max_connection_count`"
  type = object({
    set_percent   = optional(number)
    clear_percent = optional(number)
    set_value     = optional(number)
    clear_value   = optional(number)
  })
  default = null
}

variable "event_subscription_count_threshold" {
  description = "The thresholds for the subscription count event of the Message VPN, relative to `max_subscription_count`"
  type = object({
    set_percent   = optional(number)
    clear_percent = optional(number)
    set_value     = optional(number)
    clear_value   = optional(number)
  })
  default = null
}

variable "event_transacted_session_count_threshold" {
  description = "The thresholds for the transacted session count event of the Message VPN, relative to `max_transacted_session_count`"
  type = object({
    set_percent   = optional(number)
    clear_percent = optional(number)
    set_value     = optional(number)
    clear_value   = optional(number)
  })
  default = null
}

variable "event_transaction_count_threshold" {
  description = "The thresholds for the transaction count event of the Message VPN, relative to `max_transaction_count`"
  type = object({
    set_percent   = optional(number)
    clear_percent = optional(number)
    set_value     = optional(number)
    clear_value   = optional(number)
  })
  default = null
}

variable "export_subscriptions_enabled" {
  description = "Enable or disable the export of subscriptions in the Message VPN to other routers in the network over Neighbor links"
  type        = bool
  default     = null
}

variable "issuer" {
  description = "The Issuer Identifier for the OAuth provider"
  type        = string
  default     = null
}

variable "max_connection_count" {
  description = "The maximum number of client connections to the Message VPN"
  type        = number
  default     = null
}

variable "max_connection_count_per_client_username" {
  description = "The maximum number of client connections per Client Username using the Client Profile"
  type        = number
  default     = null
}

variable "max_egress_flow_count" {
  description = "The maximum number of transmit flows that can be created in the Message VPN"
  type        = number
  default     = null
}

variable "max_endpoint_count" {
  description = "The maximum number of Queues and Topic Endpoints that can be created in the Message VPN"
  type        = number
  default     = null
}

variable "max_endpoint_count_per_client_username" {
  description = "The maximum number of queues and topic endpoints that can be created by clients with the same Client Username using the Client Profile"
  type        = number
  default     = null
}

variable "max_ingress_flow_count" {
  description = "The maximum number of receive flows that can be created in the Message VPN"
  type        = number
  default     = null
}

variable "max_msgs_per_transaction" {
  description = "The maximum number of publisher and consumer messages combined that is allowed within a transaction for each client associated with this client-profile"
  type        = number
  default     = null
}

variable "max_subscription_count" {
  description = "The maximum number of local client subscriptions that can be added to the Message VPN"
  type        = number
  default     = null
}

variable "max_transacted_session_count" {
  description = "The maximum number of transacted sessions that can be created in the Message VPN"
  type        = number
  default     = null
}

variable "max_transaction_count" {
  description = "The maximum number of transactions that can be created in the Message VPN"
  type        = number
  default     = null
}

variable "mqtt_retain_max_memory" {
  description = "The maximum total memory usage of the MQTT Retain feature for this Message VPN, in MB"
  type        = number
  default     = null
}

variable "mqtt_username_validate_enabled" {
  description = "Enable or disable whether the API provided MQTT client username will be validated against the username calculated from the token(s)"
  type        = bool
  default     = null
}

variable "oauth_role" {
  description = "The OAuth role of the broker"
  type        = string
  default     = null
}

variable "publish_topic_default_action" {
  description = "The default action to take when a client using the ACL Profile publishes to a topic in the Message VPN"
  type        = string
  default     = null
}

variable "queue_control1_max_depth" {
  description = "The maximum depth of the \"Control 1\" (C-1) priority queue, in work units"
  type        = number
  default     = null
}

variable "queue_control1_min_msg_burst" {
  description = "The number of messages that are always allowed entry into the \"Control 1\" (C-1) priority queue, regardless of the `queue_control1_max_depth` value"
  type        = number
  default     = null
}

variable "queue_direct1_max_depth" {
  description = "The maximum depth of the \"Direct 1\" (D-1) priority queue, in work units"
  type        = number
  default     = null
}

variable "queue_direct1_min_msg_burst" {
  description = "The number of messages that are always allowed entry into the \"Direct 1\" (D-1) priority queue, regardless of the `queue_direct1_max_depth` value"
  type        = number
  default     = null
}

variable "queue_direct2_max_depth" {
  description = "The maximum depth of the \"Direct 2\" (D-2) priority queue, in work units"
  type        = number
  default     = null
}

variable "queue_direct2_min_msg_burst" {
  description = "The number of messages that are always allowed entry into the \"Direct 2\" (D-2) priority queue, regardless of the `queue_direct2_max_depth` value"
  type        = number
  default     = null
}

variable "queue_direct3_max_depth" {
  description = "The maximum depth of the \"Direct 3\" (D-3) priority queue, in work units"
  type        = number
  default     = null
}

variable "queue_direct3_min_msg_burst" {
  description = "The number of messages that are always allowed entry into the \"Direct 3\" (D-3) priority queue, regardless of the `queue_direct3_max_depth` value"
  type        = number
  default     = null
}

variable "queue_guaranteed1_max_depth" {
  description = "The maximum depth of the \"Guaranteed 1\" (G-1) priority queue, in work units"
  type        = number
  default     = null
}

variable "queue_guaranteed1_min_msg_burst" {
  description = "The number of messages that are always allowed entry into the \"Guaranteed 1\" (G-1) priority queue, regardless of the `queue_guaranteed1_max_depth` value"
  type        = number
  default     = null
}

variable "reject_msg_to_sender_on_no_subscription_match_enabled" {
  description = "Enable or disable the sending of a negative acknowledgment (NACK) to a client using the Client Profile when discarding a guaranteed message due to no matching subscription found"
  type        = bool
  default     = null
}

variable "replication_ack_propagation_interval_msg_count" {
  description = "The acknowledgment (ACK) propagation interval for the replication Bridge, in number of replicated messages"
  type        = number
  default     = null
}

variable "replication_allow_client_connect_when_standby_enabled" {
  description = "Enable or disable allowing clients using the Client Profile to connect to the Message VPN when its replication state is standby"
  type        = bool
  default     = null
}

variable "replication_bridge_authentication_basic_client_username" {
  description = "The Client Username the replication Bridge uses to login to the remote Message VPN"
  type        = string
  default     = null
}

variable "replication_bridge_authentication_basic_password" {
  description = "The password for the Client Username"
  type        = string
  default     = null
  sensitive   = true
}

variable "replication_bridge_authentication_client_cert_content" {
  description = "The PEM formatted content for the client certificate used by this bridge to login to the Remote Message VPN"
  type        = string
  default     = null
  sensitive   = true
}

variable "replication_bridge_authentication_client_cert_password" {
  description = "The password for the client certificate"
  type        = string
  default     = null
  sensitive   = true
}

variable "replication_bridge_authentication_scheme" {
  description = "The authentication scheme for the replication Bridge in the Message VPN"
  type        = string
  default     = null
}

variable "replication_bridge_compressed_data_enabled" {
  description = "Enable or disable use of compression for the replication Bridge"
  type        = bool
  default     = null
}

variable "replication_bridge_egress_flow_window_size" {
  description = "The size of the window used for guaranteed messages published to the replication Bridge, in messages"
  type        = number
  default     = null
}

variable "replication_bridge_retry_delay" {
  description = "The number of seconds that must pass before retrying the replication Bridge connection"
  type        = number
  default     = null
}

variable "replication_bridge_tls_enabled" {
  description = "Enable or disable use of encryption (TLS) for the replication Bridge connection"
  type        = bool
  default     = null
}

variable "replication_bridge_unidirectional_client_profile_name" {
  description = "The Client Profile for the unidirectional replication Bridge in the Message VPN"
  type        = string
  default     = null
}

variable "replication_enabled" {
  description = "Enable or disable replication for the Message VPN"
  type        = bool
  default     = null
}

variable "replication_enabled_queue_behavior" {
  description = "The behavior to take when enabling replication for the Message VPN, depending on the existence of the replication Queue"
  type        = string
  default     = null
  sensitive   = true
}

variable "replication_queue_max_msg_spool_usage" {
  description = "The maximum message spool usage by the replication Bridge local Queue (quota), in megabytes"
  type        = number
  default     = null
}

variable "replication_queue_reject_msg_to_sender_on_discard_enabled" {
  description = "Enable or disable whether messages discarded on the replication Bridge local Queue are rejected back to the sender"
  type        = bool
  default     = null
}

variable "replication_reject_msg_when_sync_ineligible_enabled" {
  description = "Enable or disable whether guaranteed messages published to synchronously replicated Topics are rejected back to the sender when synchronous replication becomes ineligible"
  type        = bool
  default     = null
}

variable "replication_role" {
  description = "The replication role for the Message VPN"
  type        = string
  default     = null
}

variable "replication_transaction_mode" {
  description = "The transaction replication mode for all transactions within the Message VPN"
  type        = string
  default     = null
}

variable "resource_server_parse_access_token_enabled" {
  description = "Enable or disable parsing of the access token as a JWT"
  type        = bool
  default     = null
}

variable "resource_server_required_audience" {
  description = "The required audience value"
  type        = string
  default     = null
}

variable "resource_server_required_issuer" {
  description = "The required issuer value"
  type        = string
  default     = null
}

variable "resource_server_required_scope" {
  description = "A space-separated list of scopes that must be present in the scope claim"
  type        = string
  default     = null
}

variable "resource_server_required_type" {
  description = "The required TYP value"
  type        = string
  default     = null
}

variable "resource_server_validate_audience_enabled" {
  description = "Enable or disable verification of the audience claim in the access token or introspection response"
  type        = bool
  default     = null
}

variable "resource_server_validate_issuer_enabled" {
  description = "Enable or disable verification of the issuer claim in the access token or introspection response"
  type        = bool
  default     = null
}

variable "resource_server_validate_scope_enabled" {
  description = "Enable or disable verification of the scope claim in the access token or introspection response"
  type        = bool
  default     = null
}

variable "resource_server_validate_type_enabled" {
  description = "Enable or disable verification of the TYP field in the access token header"
  type        = bool
  default     = null
}

variable "rest_tls_server_cert_max_chain_depth" {
  description = "The maximum depth for a REST Consumer server certificate chain"
  type        = number
  default     = null
}

variable "rest_tls_server_cert_validate_date_enabled" {
  description = "Enable or disable validation of the \"Not Before\" and \"Not After\" validity dates in the REST Consumer server certificate"
  type        = bool
  default     = null
}

variable "rest_tls_server_cert_validate_name_enabled" {
  description = "Enable or disable the standard TLS authentication mechanism of verifying the name used to connect to the remote REST Consumer"
  type        = bool
  default     = null
}

variable "semp_over_msg_bus_admin_client_enabled" {
  description = "Enable or disable \"admin client\" SEMP over the message bus commands for the current Message VPN"
  type        = bool
  default     = null
}

variable "semp_over_msg_bus_admin_distributed_cache_enabled" {
  description = "Enable or disable \"admin distributed-cache\" SEMP over the message bus commands for the current Message VPN"
  type        = bool
  default     = null
}

variable "semp_over_msg_bus_admin_enabled" {
  description = "Enable or disable \"admin\" SEMP over the message bus commands for the current Message VPN"
  type        = bool
  default     = null
}

variable "semp_over_msg_bus_enabled" {
  description = "Enable or disable SEMP over the message bus for the current Message VPN"
  type        = bool
  default     = null
}

variable "semp_over_msg_bus_legacy_show_clear_enabled" {
  description = "Enable or disable \"legacy-show-clear\" SEMP over the message bus commands (that is, SEMP show and administration requests published to the topic \"#P2P/[router name]/#client/SEMP\") for the current Message VPN"
  type        = bool
  default     = null
}

variable "semp_over_msg_bus_show_enabled" {
  description = "Enable or disable \"show\" SEMP over the message bus commands for the current Message VPN"
  type        = bool
  default     = null
}

variable "service_amqp_max_connection_count" {
  description = "The maximum number of AMQP client connections that can be simultaneously connected to the Message VPN"
  type        = number
  default     = null
}

variable "service_amqp_plain_text_enabled" {
  description = "Enable or disable the plain-text AMQP service in the Message VPN"
  type        = bool
  default     = null
}

variable "service_amqp_plain_text_listen_port" {
  description = "The port number for plain-text AMQP clients that connect to the Message VPN"
  type        = number
  default     = null
}

variable "service_amqp_tls_enabled" {
  description = "Enable or disable the use of encryption (TLS) for the AMQP service in the Message VPN"
  type        = bool
  default     = null
}

variable "service_amqp_tls_listen_port" {
  description = "The port number for AMQP clients that connect to the Message VPN over TLS"
  type        = number
  default     = null
}

variable "service_min_keepalive_timeout" {
  description = "The minimum client keepalive timeout which will be enforced for client connections"
  type        = number
  default     = null
}

variable "service_mqtt_authentication_client_cert_request" {
  description = "Determines when to request a client certificate from an incoming MQTT client connecting via a TLS port"
  type        = string
  default     = null
}

variable "service_mqtt_max_connection_count" {
  description = "The maximum number of MQTT client connections that can be simultaneously connected to the Message VPN"
  type        = number
  default     = null
}

variable "service_mqtt_plain_text_enabled" {
  description = "Enable or disable the plain-text MQTT service in the Message VPN"
  type        = bool
  default     = null
}

variable "service_mqtt_plain_text_listen_port" {
  description = "The port number for plain-text MQTT clients that connect to the Message VPN"
  type        = number
  default     = null
}

variable "service_mqtt_tls_enabled" {
  description = "Enable or disable the use of encryption (TLS) for the MQTT service in the Message VPN"
  type        = bool
  default     = null
}

variable "service_mqtt_tls_listen_port" {
  description = "The port number for MQTT clients that connect to the Message VPN over TLS"
  type        = number
  default     = null
}

variable "service_mqtt_tls_web_socket_enabled" {
  description = "Enable or disable the use of encrypted WebSocket (WebSocket over TLS) for the MQTT service in the Message VPN"
  type        = bool
  default     = null
}

variable "service_mqtt_tls_web_socket_listen_port" {
  description = "The port number for MQTT clients that connect to the Message VPN using WebSocket over TLS"
  type        = number
  default     = null
}

variable "service_mqtt_web_socket_enabled" {
  description = "Enable or disable the use of WebSocket for the MQTT service in the Message VPN"
  type        = bool
  default     = null
}

variable "service_mqtt_web_socket_listen_port" {
  description = "The port number for plain-text MQTT clients that connect to the Message VPN using WebSocket"
  type        = number
  default     = null
}

variable "service_rest_incoming_authentication_client_cert_request" {
  description = "Determines when to request a client certificate from an incoming REST Producer connecting via a TLS port"
  type        = string
  default     = null
}

variable "service_rest_incoming_authorization_header_handling" {
  description = "The handling of Authorization headers for incoming REST connections"
  type        = string
  default     = null
}

variable "service_rest_incoming_max_connection_count" {
  description = "The maximum number of REST incoming client connections that can be simultaneously connected to the Message VPN"
  type        = number
  default     = null
}

variable "service_rest_incoming_plain_text_enabled" {
  description = "Enable or disable the plain-text REST service for incoming clients in the Message VPN"
  type        = bool
  default     = null
}

variable "service_rest_incoming_plain_text_listen_port" {
  description = "The port number for incoming plain-text REST clients that connect to the Message VPN"
  type        = number
  default     = null
}

variable "service_rest_incoming_tls_enabled" {
  description = "Enable or disable the use of encryption (TLS) for the REST service for incoming clients in the Message VPN"
  type        = bool
  default     = null
}

variable "service_rest_incoming_tls_listen_port" {
  description = "The port number for incoming REST clients that connect to the Message VPN over TLS"
  type        = number
  default     = null
}

variable "service_rest_mode" {
  description = "The REST service mode for incoming REST clients that connect to the Message VPN"
  type        = string
  default     = null
}

variable "service_rest_outgoing_max_connection_count" {
  description = "The maximum number of REST Consumer (outgoing) client connections that can be simultaneously connected to the Message VPN"
  type        = number
  default     = null
}

variable "service_smf_max_connection_count" {
  description = "The maximum number of SMF client connections that can be simultaneously connected to the Message VPN"
  type        = number
  default     = null
}

variable "service_smf_max_connection_count_per_client_username" {
  description = "The maximum number of SMF client connections per Client Username using the Client Profile"
  type        = number
  default     = null
}

variable "service_smf_min_keepalive_enabled" {
  description = "Enable or disable the enforcement of a minimum keepalive timeout for SMF clients"
  type        = bool
  default     = null
}

variable "service_smf_plain_text_enabled" {
  description = "Enable or disable the plain-text SMF service in the Message VPN"
  type        = bool
  default     = null
}

variable "service_smf_tls_enabled" {
  description = "Enable or disable the use of encryption (TLS) for the SMF service in the Message VPN"
  type        = bool
  default     = null
}

variable "service_web_authentication_client_cert_request" {
  description = "Determines when to request a client certificate from a Web Transport client connecting via a TLS port"
  type        = string
  default     = null
}

variable "service_web_inactive_timeout" {
  description = "The timeout for inactive Web Transport client sessions using the Client Profile, in seconds"
  type        = number
  default     = null
}

variable "service_web_max_connection_count" {
  description = "The maximum number of Web Transport client connections that can be simultaneously connected to the Message VPN"
  type        = number
  default     = null
}

variable "service_web_max_connection_count_per_client_username" {
  description = "The maximum number of Web Transport client connections per Client Username using the Client Profile"
  type        = number
  default     = null
}

variable "service_web_max_payload" {
  description = "The maximum Web Transport payload size before fragmentation occurs for clients using the Client Profile, in bytes"
  type        = number
  default     = null
}

variable "service_web_plain_text_enabled" {
  description = "Enable or disable the plain-text Web Transport service in the Message VPN"
  type        = bool
  default     = null
}

variable "service_web_tls_enabled" {
  description = "Enable or disable the use of TLS for the Web Transport service in the Message VPN"
  type        = bool
  default     = null
}

variable "subscribe_share_name_default_action" {
  description = "The default action to take when a client using the ACL Profile subscribes to a share-name subscription in the Message VPN"
  type        = string
  default     = null
}

variable "subscribe_topic_default_action" {
  description = "The default action to take when a client using the ACL Profile subscribes to a topic in the Message VPN"
  type        = string
  default     = null
}

variable "tcp_congestion_window_size" {
  description = "The TCP initial congestion window size for clients using the Client Profile, in multiples of the TCP Maximum Segment Size (MSS)"
  type        = number
  default     = null
}

variable "tcp_keepalive_count" {
  description = "The number of TCP keepalive retransmissions to a client using the Client Profile before declaring that it is not available"
  type        = number
  default     = null
}

variable "tcp_keepalive_idle_time" {
  description = "The amount of time a client connection using the Client Profile must remain idle before TCP begins sending keepalive probes, in seconds"
  type        = number
  default     = null
}

variable "tcp_keepalive_interval" {
  description = "The amount of time between TCP keepalive retransmissions to a client using the Client Profile when no acknowledgment is received, in seconds"
  type        = number
  default     = null
}

variable "tcp_max_segment_size" {
  description = "The TCP maximum segment size for clients using the Client Profile, in bytes"
  type        = number
  default     = null
}

variable "tcp_max_window_size" {
  description = "The TCP maximum window size for clients using the Client Profile, in kilobytes"
  type        = number
  default     = null
}

variable "tls_allow_downgrade_to_plain_text_enabled" {
  description = "Enable or disable the allowing of TLS SMF clients to downgrade their connections to plain-text connections"
  type        = bool
  default     = null
}

variable "username_claim_name" {
  description = "The name of the username claim"
  type        = string
  default     = null
}



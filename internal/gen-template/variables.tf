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
  description = "The name of the OAuth Profile to be created and added to the Message VPN. If not specified, no OAuth Profile will be added. If specified, OAuth will be enabled on the VPN and this profile will be set as the default profile. Default is \"\""
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

#AutoAddAttributes

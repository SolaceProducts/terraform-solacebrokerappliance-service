provider "solacebroker" {
  username = "admin"
  password = "admin"
  url      = "http://localhost:8080"
  skip_api_check  = true
}

module "testvpn" {
  source = "../.."
  # version = ""

  msg_vpn_name        = "testvpn"
  acl_profile_name    = "testvpn-acl-profile"
  client_profile_name = "testvpn-client-profile"
  oauth_profile_name  = "testvpnOauthProfile"
  oauth_profile_client_required_claims = [
    {
      claim_name  = "audience"
      claim_value = "{ \"aud\": \"myAudience\" }"
    },
    {
      claim_name  = "sub"
      claim_value = "{ \"sub\": 123456789 }",
    }
  ]
  oauth_profile_resource_server_required_claims = [
    {
      claim_name  = "audience"
      claim_value = "{ \"aud\": \"myAudience\" }"
    },
    {
      claim_name  = "sub"
      claim_value = "{ \"sub\": 123456789 }",
    }
  ]
  cert_matching_rule_name = "testvpnCertMatchingRule"
  cert_matching_rule_conditions = [
    {
      source     = "issuer"
      expression = "C = CA, ST = Ontario, L = Kanata, O = Solace Systems, OU = IT, CN = *.messaging.solace"
    }
  ]
  cert_matching_rule_attribute_filters = [
    {
      filter_name     = "testFilter"
      attribute_name  = "username"
      attribute_value = "test"
    }
  ]
  authentication_kerberos_enabled = true
}

output "created_msg_vpn" {
  value     = module.testvpn.msg_vpn
  sensitive = true
}

output "created_acl_profile" {
  value = module.testvpn.acl_profile
}

output "created_client_profile" {
  value = module.testvpn.client_profile
}

output "created_oauth_profile" {
  value     = module.testvpn.oauth_profile
  sensitive = true
}

output "created_oauth_profile_client_required_claims" {
  value = module.testvpn.oauth_profile_client_required_claims
}

output "created_oauth_profile_resource_server_required_claims" {
  value = module.testvpn.oauth_profile_resource_server_required_claims
}

output "created_cert_matching_rule" {
  value = module.testvpn.cert_matching_rule
}

output "created_cert_matching_rule_conditions" {
  value = module.testvpn.cert_matching_rule_conditions
}

output "created_cert_matching_rule_attribute_filters" {
  value = module.testvpn.cert_matching_rule_attribute_filters
}

module "testvpn2" {
  source = "../.."
  # version = ""

  msg_vpn_name        = "testvpn2"
  acl_profile_name    = "testvpn-acl-profile2"
  client_profile_name = "testvpn-client-profile2"
}

module "defaultvpn" {
  source = "../.."
  # version = ""

  msg_vpn_name = "default"
  enabled      = false
}

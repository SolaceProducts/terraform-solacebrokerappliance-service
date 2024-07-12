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

provider "solacebroker" {
  username = "admin"
  password = "admin"
  url      = "http://localhost:8080" # adjust to your appliance management host and SEMP port
}

module "testvpn" {
  source = "../.."

  msg_vpn_name = "vpn-with-mtls"
  // No need to set the VPN enabled, it defaults to true
  // enabled = true

  // example VPN configuration (not strictly required required here because of certificate matching rule configured )
  authentication_client_cert_enabled = true

  // example certificate matching rule
  cert_matching_rule_name = "testvpnCertMatchingRule"

  // not required if certificate matching rule is configured
  // authentication_client_cert_certificate_matching_rules_enabled = true

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
}

output "created_vpn" {
  value     = module.testvpn.msg_vpn
  sensitive = true
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


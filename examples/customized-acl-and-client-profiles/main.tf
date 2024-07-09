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
  url      = "http://localhost:8080"
}

module "testvpn" {
  source = "../.."

  msg_vpn_name = "vpn-with-acl-and-client-profiles"

  // Configure an ACL profile. This example allows clients to connect from any address. All other ACL rules are default
  acl_profile_name              = "my-acl-profile"
  client_connect_default_action = "allow"

  // Configure a client profile. This example disables compression, which is by default enabled. All other client profile settings are default
  client_profile_name = "my-client-profile"
  compression_enabled = false

  // No need to set the VPN enabled, it defaults to true
  // enabled = true
}

output "created_vpn" {
  value     = module.testvpn.msg_vpn
  sensitive = true
}

output "created_acl_profile" {
  value = module.testvpn.acl_profile
}

output "created_client_profile" {
  value = module.testvpn.client_profile
}


# Solace PubSub+ Software Event Broker Service Terraform Module

Terraform module that encapsulates a [message VPN](https://docs.solace.com/Features/VPN/Managing-Message-VPNs.htm) including client and ACL profiles, resource limits and service on the [Solace PubSub+ Event Broker](https://solace.com/products/event-broker/).

The basic use case is to create a new message VPN with a permissive `default` ACL and client profile, ready for messaging. Optionally, an additional fully customizable ACL profile and a client profile can be defined. The module also adds advanced client certificate authentication and OAuth authentication configuration support.

Note: the `default` client username that is automatically created with the new VPN is disabled. It is recommended to use the [Client Module](https://registry.terraform.io/modules/SolceProducts/client/solacebroker/latest) to setup a client username if required. Also, services that require message VPN specific ports, including REST, MQTT etc. are disabled by default and need to be enabled/configured through optional variables.

Use case details are provided in the [Examples](#examples).

## Module input variables

### Required

* `msg_vpn_name` - the name of the new message VPN to be created

### Optional

* `acl_profile_name` - the name of the optionally added ACL profile. A `default` profile is always created and if left at default empty then no additional ACL profile will be created.
* `client_profile_name` - the name of the optionally added client profile. A `default` profile is always created and if left at default empty then no additional ACL profile will be created.
* `oauth_profile_name` - the name of an optionally added OAuth profile. Note that there will be no OAuth profile created unless a non-empty name is provided.
* `oauth_profile_client_required_claims` - a set of optional client-required claims.
* `oauth_profile_resource_server_required_claims` - a set of optional server-required claims.
* `cert_matching_rule_name` - the name of an optionally added certificate matching rule. Note that there will be no certificate matching rule created unless a non-empty name is provided.
* `cert_matching_rule_conditions` - a set of optional certificate matching rule conditions.
* `cert_matching_rule_attribute_filters` - a set of optional certificate matching rule attribute filters.

Additional optional module variable names are the same as the underlying resource attributes. The recommended approach to determine variable name mappings is to look up the resource's documentation for matching attribute names:

| Resource name |
|---------------|
|[solacebroker_msg_vpn](https://registry.terraform.io/providers/solaceproducts/solacebrokerappliance/latest/docs/resources/msg_vpn#optional)|
|[solacebroker_msg_vpn_acl_profile](https://registry.terraform.io/providers/solaceproducts/solacebrokerappliance/latest/docs/resources/msg_vpn_acl_profile#optional)|
|[solacebroker_msg_vpn_client_profile](https://registry.terraform.io/providers/solaceproducts/solacebrokerappliance/latest/docs/resources/msg_vpn_client_profile#optional)|
|[solacebroker_msg_vpn_authentication_oauth_profile](https://registry.terraform.io/providers/solaceproducts/solacebrokerappliance/latest/docs/resources/msg_vpn_authentication_oauth_profile#optional)|

Most optional variables' default value is `null`, meaning that if not provided then the resource default value will be provisioned on the broker.

Exceptions: the following optional variables' default value differ from the resource attribute defaults:

| Input variable | Default value | Note |
|----------------|---------------|------|
| `authentication_basic_type` | `internal` |
| `dmr_enabled` | `true` | 
| `enabled` | `true` | the Message VPN and underlying created objects |
| `jndi_enabled` | `true` |
| `max_msg_spool_usage` | 1500 | MB, message VPN |

## Module outputs

[Module outputs](https://developer.hashicorp.com/terraform/language/values/outputs) provide reference to created resources. Any reference to a resource that has not been created will be set to `(null)`.

Note that the "message VPN" output is [sensitive](https://developer.hashicorp.com/terraform/language/values/outputs#sensitive-suppressing-values-in-cli-output) due to some sensitive attributes it contains.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_solacebroker"></a> [solacebroker](https://registry.terraform.io/providers/solaceproducts/solacebrokerappliance/latest) | >= 1.0 |

## Resources

The following table shows the resources created. "X" denotes a resource always created, "O" is a resource that may be created optionally

| Name |  | Notes |
|------|------|------|
| solacebroker_msg_vpn | X | |
| solacebroker_msg_vpn_acl_profile | O | This is an additional configurable profile. A default ACL profile is always created |
| solacebroker_msg_vpn_client_profile | O | This is an additional configurable profile. A default client profile is always created |
| solacebroker_msg_vpn_authentication_oauth_profile | O | |
| solacebroker_msg_vpn_authentication_oauth_profile_client_required_claim | O | Requires above AOuth profile and it will be assigned to that |
| solacebroker_msg_vpn_authentication_oauth_profile_resource_server_required_claim | O | Requires above AOuth profile and it will be assigned to that |
| solacebroker_msg_vpn_cert_matching_rule | O | |
| solacebroker_msg_vpn_cert_matching_rule_condition | O | Requires above certification matching rule and it will be assigned to that |
| solacebroker_msg_vpn_cert_matching_rule_attribute_filter | O | Requires above certification matching rule and it will be assigned to that |

## Examples

Refer to the following configuration examples:

- [Basic VPN](examples/basic-vpn)
- [Services and listen ports](examples/services-and-listen-ports)
- [Customized ACL and client profiles](examples/customized-acl-and-client-profiles)
- [OAuth authentication](examples/oauth-authentication)
- [Client certificate authentication](examples/client-certificate-authentication)

## Module use recommendations

This module is expected to be used primarily by middleware teams. It is primarily concerned with setting an environment and constraints where application developer teams may add their specific requirements through the Solace Client, Queues & Endpoints, JNDI or REST delivery modules. This module may be forked and adjusted with private defaults.

## Resources

For more information about Solace technology in general please visit these resources:

- Solace [Technical Documentation](https://docs.solace.com/)
    - [Configuring Message VPNs](https://docs.solace.com/Features/VPN/Configuring-VPNs.htm)
- The Solace Developer Portal website at: [solace.dev](//solace.dev/)
- Understanding [Solace technology](//solace.com/products/platform/)
- Ask the [Solace community](//dev.solace.com/community/).

# Solace PubSub+ Appliance Service Terraform Module

This Terraform module encapsulates a [Message VPN](https://docs.solace.com/Features/VPN/Managing-Message-VPNs.htm) including client and ACL profiles, resource limits and service on the [Solace PubSub+ Appliance](https://solace.com/products/event-broker/).

You can use this module to create a new Message VPN with a permissive `default` ACL and client profile, ready for messaging. You can also define an optional additional fully customizable ACL and client profile. The module also adds advanced client certificate authentication and OAuth authentication configuration support.

Note: the `default` client username that is automatically created with the new Message VPN is disabled. We recommend that you use the [Client Module](https://registry.terraform.io/modules/SolaceProducts/client/solacebrokerappliance/latest) to setup a client username if required. In addition, services that require Message VPN specific ports, including REST, MQTT etc. are disabled by default and need to be enabled/configured through optional variables.

Use case details are provided in the [Examples](#examples) section.

## Module input variables

### Required

* `msg_vpn_name` - The name of the new Message VPN to be created.

### Optional

* `acl_profile_name` - The name of the optionally added ACL profile. A `default` profile is always created and if left at default empty then no additional ACL profile will be created.
* `client_profile_name` - The name of the optionally added client profile. A `default` profile is always created and if left at default empty then no additional ACL profile will be created.
* `oauth_profile_name` - The name of an optionally added OAuth profile. Note that there will be no OAuth profile created unless a non-empty name is provided.
* `oauth_profile_client_required_claims` - A set of optional client-required claims.
* `oauth_profile_resource_server_required_claims` - A set of optional server-required claims.
* `cert_matching_rule_name` - The name of an optionally added certificate matching rule. Note that there will be no certificate matching rule created unless a non-empty name is provided.
* `cert_matching_rule_conditions` - A set of optional certificate matching rule conditions.
* `cert_matching_rule_attribute_filters` - A set of optional certificate matching rule attribute filters.

Additional optional module variable names are the same as the underlying resource attributes. To determine the variable name mappings, we recommend that you look for matching attribute names in the documentation for the resource:

| Resource name |
|---------------|
|[solacebroker_msg_vpn](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs/resources/msg_vpn#optional)|
|[solacebroker_msg_vpn_acl_profile](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs/resources/msg_vpn_acl_profile#optional)|
|[solacebroker_msg_vpn_client_profile](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs/resources/msg_vpn_client_profile#optional)|
|[solacebroker_msg_vpn_authentication_oauth_profile](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs/resources/msg_vpn_authentication_oauth_profile#optional)|

The default value for most of the optional variables is `null`, meaning that if you don’t provide a value then the default value of the resource is provisioned on the event broker.

Exceptions: the following optional variables' default value differ from the resource attribute defaults:

| Input variable | Default value | Note |
|----------------|---------------|------|
| `authentication_basic_type` | `internal` |
| `dmr_enabled` | `true` | 
| `enabled` | `true` | The Message VPN and underlying created objects |
| `jndi_enabled` | `true` |
| `max_msg_spool_usage` | 1500 | MB, Message VPN |

## Module outputs

[Module outputs](https://developer.hashicorp.com/terraform/language/values/outputs) provide reference to created resources. Any reference to a resource that has not been created will be set to `(null)`.

Note that the "Message VPN" output is [sensitive](https://developer.hashicorp.com/terraform/language/values/outputs#sensitive-suppressing-values-in-cli-output) due to some sensitive attributes it contains.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_solacebrokerappliance"></a> [solacebrokerappliance](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest) | >= 1.0 |

## Resources

The following table shows the resources created. "X" denotes a resource that is always created, "O" denotes a resource that you have the option to create.

| Name |  | Notes |
|------|------|------|
| solacebroker_msg_vpn | X | |
| solacebroker_msg_vpn_acl_profile | O | This is an additional configurable profile. A default ACL profile is always created. |
| solacebroker_msg_vpn_client_profile | O | This is an additional configurable profile. A default client profile is always created. |
| solacebroker_msg_vpn_authentication_oauth_profile | O | |
| solacebroker_msg_vpn_authentication_oauth_profile_client_required_claim | O | This requires the above certificate matching rule and will be assigned to that rule upon creation. |
| solacebroker_msg_vpn_authentication_oauth_profile_resource_server_required_claim | O | This requires the above certificate matching rule and will be assigned to that rule upon creation. |
| solacebroker_msg_vpn_cert_matching_rule | O | |
| solacebroker_msg_vpn_cert_matching_rule_condition | O | Requires above certification matching rule and it will be assigned to that |
| solacebroker_msg_vpn_cert_matching_rule_attribute_filter | O | Requires above certification matching rule and it will be assigned to that |

## Examples

The following examples demonstrate several specific use cases for this module:

- [Basic VPN](examples/basic-vpn)
- [Services and listen ports](examples/services-and-listen-ports)
- [Customized ACL and client profiles](examples/customized-acl-and-client-profiles)
- [OAuth authentication](examples/oauth-authentication)
- [Client certificate authentication](examples/client-certificate-authentication)

## Module use recommendations

This module is expected to be used primarily by middleware teams. It is primarily concerned with setting an environment and constraints where application developer teams may add their specific requirements through the Solace Client, Queues & Endpoints, JNDI or REST Delivery modules. This module may be forked and adjusted with private defaults.

## Resources

For more information about Solace technology in general please visit these resources:

- Solace [Technical Documentation](https://docs.solace.com/)
    - [Configuring Message VPNs](https://docs.solace.com/Features/VPN/Configuring-VPNs.htm)
- The Solace Developer Portal website at: [solace.dev](//solace.dev/)
- Understanding [Solace technology](//solace.com/products/platform/)
- Ask the [Solace community](//dev.solace.com/community/).

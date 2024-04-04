# Client Certificate Authentication Configuration Example

This example shows how to configure [client certificate authentication](https://docs.solace.com/Security/Configuring-Client-Authentication.htm#Client-Cert) (or mTLS) for clients connecting to a PubSub+ event broker at the Message VPN level, leveraging the Service Terraform module.

Note: a pre-requisite for client certificate authentication is broker-level server key, certificate and certificate authorities configured, which is outside the scope of this module.

The module exposes [client certificate authentication related message VPN configuration](https://docs.solace.com/Security/Configuring-Client-Authentication.htm#Client-CERT-VPNs) through input variables. It also supports the setup of a [message VPN matching](https://docs.solace.com/Security/Configuring-Client-Authentication.htm#Configur) rule with a set of conditions or a set of attribute filters. Note that if more matching rules are required then these will need to be configured outside the module.

## Module Configuration in the Example

### Required Inputs

* `msg_vpn_name` - set to `vpn-with-mtls` in the example

### Optional Inputs

* `authentication_client_cert_enabled` - set to `true` for client certificate authentication in the example. Automatically enabled if VPN matching is configured
* `cert_matching_rule_name` - specified if message VPN matching is required
* `cert_matching_rule_conditions` - a set of conditions for above certificate matching rule
* `cert_matching_rule_attribute_filters` - a set of filters for above certificate matching rule

Other optional module input variables have the same name as the attributes of the underlying provider resource. If omitted then the default for the related resource attribute will be configured on the broker. For attributes and defaults, refer to the documentation of ["solacebroker_msg_vpn"](https://registry.terraform.io/providers/solaceproducts/solacebrokerappliance/latest/docs/resources/msg_vpn#optional).

The module default for the `enabled` variable is true, which enables the message VPN and underlying resources.

### Output

The module `created_vpn` and `created_cert_matching_rule` outputs refer to the created message VPN and the certificate matching rule. There are also outputs for the list of conditions and attribute filters.

## Created resources

This example will create following resources:

* `solacebroker_msg_vpn`
* `solacebroker_msg_vpn_cert_matching_rule`
* `solacebroker_msg_vpn_cert_matching_rule_condition`
* `solacebroker_msg_vpn_cert_matching_rule_attribute_filter`

## Running the Example

### Access to a PubSub+ broker

If you don't already have access to a broker, refer to the [Developers page](https://www.solace.dev/) for options to get started.

### Sample source code

The sample is available from the module GitHub repo:

```bash
git clone https://github.com/SolaceProducts/terraform-solacebrokerappliance-service.git
cd examples/client-certificate-authentication
```

### Adjust Provider Configuration

Adjust the [provider parameters](https://registry.terraform.io/providers/solaceproducts/solacebrokerappliance/latest/docs#schema) in `main.tf` according to your broker. The example configuration shows settings for a local broker running in Docker.

### Create the resource

Hint: You can verify configuration changes on the broker, before and after, using the [PubSub+ Broker Manager Web UI](https://docs.solace.com/Admin/Broker-Manager/PubSub-Manager-Overview.htm)

Execute from this folder:

```bash
terraform init
terraform plan
terraform apply
```

Run `terraform destroy` to clean up created resources when no longer needed. Note that as part of this command there may be a warning about default objects cannot be deleted, this is normal and expected here.

## Additional Documentation

Refer to the [OAuth Authentication](https://docs.solace.com/Security/Configuring-Client-Authentication.htm#OAuth) section in the PubSub+ documentation.

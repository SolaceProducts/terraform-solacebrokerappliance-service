# Client Certificate Authentication Configuration Example

This example shows how to configure [client certificate authentication](https://docs.solace.com/Security/Configuring-Client-Authentication.htm#Client-Cert) (or mTLS) for clients connecting to a PubSub+ event broker at the Message VPN level, leveraging the Service Terraform module.

Note: before you can enable client certificate authentication, you need an event broker-level server key, certificate, and you must configure certificate authorities. These prerequisites are outside the scope of this module.

The module exposes [client certificate authentication related Message VPN configuration](https://docs.solace.com/Security/Configuring-Client-Authentication.htm#Client-CERT-VPNs) through input variables. It also supports the setup of a [Message VPN matching](https://docs.solace.com/Security/Configuring-Client-Authentication.htm#Configur) rule with a set of conditions or a set of attribute filters. Note that if more matching rules are required then you need to configure them outside the module.

## Module Configuration in the Example

### Required Inputs

* `msg_vpn_name` - Set to `vpn-with-mtls` in the example.

### Optional Inputs

* `authentication_client_cert_enabled` - Set to `true` for client certificate.authentication in the example. Automatically enabled if VPN matching is configured.
* `cert_matching_rule_name` - Specified if Message VPN matching is required.
* `cert_matching_rule_conditions` - A set of conditions for above certificate matching rule.
* `cert_matching_rule_attribute_filters` - A set of filters for above certificate matching rule.

Other optional module input variables have the same name as the attributes of the underlying provider resource. If omitted, then the default for the related resource attribute will be configured on the broker. For a list of attributes and the corresponding defaults, see the documentation of ["solacebroker_msg_vpn"](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs/resources/msg_vpn#optional).

The module default for the `enabled` variable is true, which enables the Message VPN and underlying resources.

### Output

The module `created_vpn` and `created_cert_matching_rule` outputs refer to the created Message VPN and the certificate matching rule. There are also outputs for the list of conditions and attribute filters.

## Created Resources

This example will create the following resources:

* `solacebroker_msg_vpn`
* `solacebroker_msg_vpn_cert_matching_rule`
* `solacebroker_msg_vpn_cert_matching_rule_condition`
* `solacebroker_msg_vpn_cert_matching_rule_attribute_filter`

## Running the Example

### Access to a PubSub+ Event Broker

If you don't already have access to a broker, see the [Developers page](https://www.solace.dev/) for options to get started.

### Sample Source Code

The sample is available from the module GitHub repo:

```bash
git clone https://github.com/SolaceProducts/terraform-solacebrokerappliance-service.git
cd examples/client-certificate-authentication
```

### Adjust the Provider Configuration

Adjust the [provider parameters](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs#schema) in `main.tf` according to your broker. The example configuration shows settings for a local broker running in Docker.

### Create the Resource

Tip: You can verify configuration changes on the broker, before and after, using the [PubSub+ Broker Manager Web UI](https://docs.solace.com/Admin/Broker-Manager/PubSub-Manager-Overview.htm).

Execute from this folder:

```bash
terraform init
terraform plan
terraform apply
```

Run `terraform destroy` to clean up the created resources when they are no longer needed. Note that as part of this command there may be a warning about default objects cannot be deleted, this is normal and expected here.

## Additional Documentation

For more information, see [OAuth Authentication](https://docs.solace.com/Security/Configuring-Client-Authentication.htm#OAuth) section in the PubSub+ documentation.

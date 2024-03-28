# Message VPN Services and Listen Ports Configuration Example

The example in this directory demonstrates how to configure services including ports for a new message VPN on the PubSub+ event broker, leveraging the Service Terraform module.

SMF and Web Transport messaging services are configured at the broker level and are enabled on the message VPN created by the Service module. Other services including REST, MQTT and AMQP are configured at the message VPN level and need to be individually setup for each VPN. They are disabled by default and need to be enabled, configured and a port assigned if required through module variables. The example will show how to do that.

A service may also use plain text or secure transport. While it is generally recommended to use secure transport and disable plain text, secure transport requires a server certificate installed on the broker. For easier development and demo purposes, plain text SMF and Web Transport services are enabled by default on the message VPN and should be disabled through module variables to meet security requirements.

## Module Configuration in the Example

### Required Inputs

* `msg_vpn_name` - set to `rest-enabled-vpn` in the example

### Optional Inputs

* `service_rest_incoming_plain_text_enabled` - set to `true` in this example
* `service_rest_incoming_plain_text_listen_port` - set to `9001` in this example. Note that the port number must be unique for the broker, port 9000 is already used by the default VPN

Other optional module input variables have the same name as the attributes of the underlying provider resource. If omitted then the default for the related resource attribute will be configured on the broker. For attributes and defaults, refer to the [documentation of "solacebroker_msg_vpn"](https://registry.terraform.io/providers/solaceproducts/solacebrokerappliance/latest/docs/resources/msg_vpn#optional).

The module default for the `enabled` variable is true, which enables the message VPN and underlying resources.

### Output

The module `created_vpn` output refers to the created message VPN.

## Created resources

This example will create following resources:

* `solacebroker_msg_vpn`

Note that `default` ACL profile, client profile and client username objects will also be automatically created as part of the new VPN but are only available by referencing their name.

## Running the Example

### Access to a PubSub+ broker

If you don't already have access to a broker, refer to the [Developers page](https://www.solace.dev/) for options to get started.

### Sample source code

The sample is available from the module GitHub repo:

```bash
git clone https://github.com/SolaceProducts/terraform-solacebroker-rest-delivery.git
cd examples/services-and-listen-ports
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

Refer to the [Configuring Message VPNs](https://docs.solace.com/Features/VPN/Configuring-VPNs.htm) section in the PubSub+ documentation.

# Message VPN Configuration Example

Configuration in this directory creates a basic [message VPN](https://docs.solace.com/Features/VPN/Managing-Message-VPNs.htm) on the PubSub+ event broker, leveraging the Service Terraform module.

The created VPN will enable SMF and Web Transport messaging services with a message spool of 1500 MB assigned by default, as well as use of JNDI and DMR. Refer to the example [Services and listen ports](examples/services-and-listen-ports) how to enable and configure other services including REST, MQTT and AMQP.

The VPN will include a `default` permissive ACL profile and a client profile, similar to the ones in the `default` message VPN.
These profiles will enable ready-to-go messaging on the VPN for development and demo purposes. For production use a customized ACL profile and a client profile should be specified as in [this example](examples/customized-client-and-acl-profiles).

The default authentication method will be set to basic authentication with internal database.

 A `default` client username will also be created, however it will be shutdown and it is left to the user to setup a client username that meets their security requirements. The recommended way is to use the [Client Module](https://registry.terraform.io/modules/SolceProducts/client/solacebroker/latest) to setup a client username.

 Note: while not part of this module, it is strongly recommended to have the broker `default` message VPN, which allows unauthenticated access with any client username, shutdown.

## Module Configuration in the Example

### Required Inputs

* `msg_vpn_name` - set to `myvpn` in the example

### Optional Inputs

Optional module input variables have the same name as the attributes of the underlying provider resource. If omitted then the default for the related resource attribute will be configured on the broker. For attributes and defaults, refer to the [documentation of "solacebroker_msg_vpn"](https://registry.terraform.io/providers/solaceproducts/solacebrokerappliance/latest/docs/resources/msg_vpn#optional).

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
cd examples/basic-vpn
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

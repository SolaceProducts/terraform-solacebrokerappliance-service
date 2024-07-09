# Message VPN Configuration Example

Configuration in this directory creates a basic [Message VPN](https://docs.solace.com/Features/VPN/Managing-Message-VPNs.htm) on the PubSub+ event broker, leveraging the Service Terraform module.

The created Message VPN enables SMF and Web Transport messaging services with a message spool of 1500 MB assigned by default, as well as the use of JNDI and DMR. See the example [Services and listen ports](examples/services-and-listen-ports) how to enable and configure other services including REST, MQTT and AMQP.

The VPN includes a `default` permissive ACL profile and a client profile, like the ones in the `default` Message VPN.
These profiles enable ready-to-go messaging on the VPN for development and demo purposes. For production use you should specify a customized ACL and client profile as in [this example](examples/customized-client-and-acl-profiles).

The default authentication method will be set to basic authentication with internal database.

 A `default` client username is also created, however it will be shutdown and it is left to the user to setup a client username that meets their security requirements. We recommended that you use the [Client Module](https://registry.terraform.io/modules/SolaceProducts/client/solacebrokerappliance/latest) to setup a client username.

 Note: while not part of this module, we strongly recommend that you shutdown the `default` Message VPN on the event broker, because it allows unauthenticated access with any client username.

## Module Configuration in the Example

### Required Inputs

* `msg_vpn_name` - Set to `myvpn` in the example.

### Optional Inputs

Optional module input variables have the same name as the attributes of the underlying provider resource. If omitted, then the default for the related resource attribute will be configured on the broker. For a list of attributes and the corresponding defaults, see the [documentation of "solacebroker_msg_vpn"](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs/resources/msg_vpn#optional).

The module default for the `enabled` variable is true, which enables the Message VPN and underlying resources.

### Output

The module `created_vpn` output refers to the created Message VPN.

## Created Resources

This example will create the following resources:

* `solacebroker_msg_vpn`

Note that `default` ACL profile, client profile and client username objects will also be automatically created as part of the new Message VPN but are only available by referencing their name.

## Running the Example

### Access to a PubSub+ Event Broker

If you don't already have access to a broker, see the [Developers page](https://www.solace.dev/) for options to get started.

### Sample Source Code

The sample is available from the module GitHub repo:

```bash
git clone https://github.com/SolaceProducts/terraform-solacebrokerappliance-service.git
cd examples/basic-vpn
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

For more information, see [Configuring Message VPNs](https://docs.solace.com/Features/VPN/Configuring-VPNs.htm) section in the PubSub+ documentation.

# OAuth Authentication Configuration Example

This example shows how to configure OAuth authentication for clients connecting to a PubSub+ appliance at the Message VPN level, leveraging the Service Terraform module.

To set this up, you must enable OAuth authentication on the new Message VPN and create an OAuth profile.. With specifying the `oauth_profile_name` variable, the module will take care of both. Necessary [OAuth profile attributes](https://docs.solace.com/Security/Configuring-Client-Authentication.htm#Managing-OAuth-Profiles) can be set through module variables. It is also possible to provide a list of required claim values for both client or resource server roles of the event broker.

Note that the module supports creating one OAuth profile, which will also be set as the default for the Message VPN. Additional OAuth profiles may be configured outside the module.  

## Module Configuration in the Example

### Required Inputs

* `msg_vpn_name` - Set to `vpn-with-oauth` in the example.

### Optional Inputs

* `oauth_profile_name` - Set to `sampleVpnOauthProfile`, must be provided to get an OAuth profile created. This profile will be set as the default VPN OAuth profile. This will also enable OAuth authentication for the VPN.
* `oauth_role` - An example module input variable for the OAuth profile.
* `oauth_profile_client_required_claims` - A set of required claims when the event broker is acting as an OAuth client.
* `oauth_profile_resource_server_required_claims` - A set of required claims when the event broker is acting as an OAuth resource server.

Other optional module input variables have the same name as the attributes of the underlying provider resource. If omitted, then the default for the related resource attribute will be configured on the broker. For a list of attributes and the corresponding defaults, see the documentation of ["solacebroker_msg_vpn_authentication_oauth_profile"](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs/resources/msg_vpn_authentication_oauth_profile#optional).

The module default for the `enabled` variable is true, which enables the Message VPN and underlying resources.

### Output

The module `created_vpn` and `created_oauth_profile` outputs refer to the created Message VPN and the OAuth profile. The claims outputs provide the list of the created required claims.

## Created Resources

This example will create the following resources:

* `solacebroker_msg_vpn`
* `solacebroker_msg_vpn_authentication_oauth_profile`
* `solacebroker_msg_vpn_authentication_oauth_profile_client_required_claim`
* `solacebroker_msg_vpn_authentication_oauth_profile_resource_server_required_claim`

## Running the Example

### Access to a PubSub+ Appliance

If you don't already have access to a broker, see the [Developers page](https://www.solace.dev/) for options to get started.

### Sample Source Code

The sample is available from the module GitHub repo:

```bash
git clone https://github.com/SolaceProducts/terraform-solacebrokerappliance-service.git
cd examples/oauth-authentication
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

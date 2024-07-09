# Customized ACL and Client Profile Configuration Example

Configuration in this directory shows how to create a customized [ACL profile](https://docs.solace.com/Security/Granting-Clients-Access.htm) or a [client profile](https://docs.solace.com/Security/Assigning-Client-Profiles.htm) on a new Message VPN on the PubSub+ appliance, leveraging the Service Terraform module.

A new Message VPN automatically includes a permissive `default` ACL profile and a `default` client profile for development and demo purposes. They are not configurable through module variables. If you need profiles to meet specific requirements, the module enables creating an additional customizable ACL and client profile. At a minimum, a name for the profile must be provided and any non-default attribute values.

## Module Configuration in the Example

### Required Inputs

* `msg_vpn_name` - Set to `vpn-with-acl-and-client-profiles` in the example.

### Optional Inputs

* `acl_profile_name` - An additional ACL profile will only be created if a name is provided.
* `client_connect_default_action` - A random attribute demonstrating setting a non-default value.
* `client_profile_name` - An additional client profile will only be created if a name is provided.
* `compression_enabled` - A random attribute demonstrating setting a non-default value.

Other optional module input variables have the same name as the attributes of the underlying provider resource. If omitted, then the default for the related resource attribute will be configured on the broker. For a list of attributes and the corresponding defaults, see the documentation of ["solacebroker_msg_vpn"](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs/resources/msg_vpn#optional), ["solacebroker_msg_vpn_acl_profile"](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs/resources/msg_vpn_acl_profile#optional) and ["solacebroker_msg_vpn_client_profile"](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs/resources/msg_vpn_client_profile#optional).

The module default for the `enabled` variable is true, which enables the Message VPN and underlying resources.

### Output

The module `created_vpn` output refers to the created Message VPN, `created_acl_profile` and `created_client_profile` refer to the additional ACL and client profiles included in the VPN.

## Created Resources

This example will create the following resources:

* `solacebroker_msg_vpn`
* `solacebroker_msg_vpn_acl_profile`
* `solacebroker_msg_vpn_client_profile`

Note that `default` ACL profile, client profile and client username objects will also be automatically created as part of the new Message VPN but are only available by referencing their name.

## Running the Example

### Access to a PubSub+ Appliance

If you don't already have access to a broker, see the [Developers page](https://www.solace.dev/) for options to get started.

### Sample Source Code

The sample is available from the module GitHub repo:

```bash
git clone https://github.com/SolaceProducts/terraform-solacebrokerappliance-service.git
cd examples/customized-acl-and-client-profiles
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

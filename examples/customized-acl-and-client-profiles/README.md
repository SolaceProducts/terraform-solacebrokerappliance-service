# Customized ACL and Client Profile Configuration Example

Configuration in this directory shows how to create a customized [ACL profile](https://docs.solace.com/Security/Granting-Clients-Access.htm) or a [client profile](https://docs.solace.com/Security/Assigning-Client-Profiles.htm) on a new message VPN on the PubSub+ event broker, leveraging the Service Terraform module.

A new message VPN will automatically include a permissive `default` ACL profile and a `default` client profile that support development and demo purposes. They are not configurable through module variables. If profiles are required to meet specific requirements, the module enables creating an additional customizable ACL and client profile. At a minimum, a name for the profile must be provided and any non-default attribute values.

## Module Configuration in the Example

### Required Inputs

* `msg_vpn_name` - set to `vpn-with-acl-and-client-profiles` in the example

### Optional Inputs

* `acl_profile_name` - an additional ACL profile will only be created if a name is provided
* `client_connect_default_action` - a random attribute demonstrating setting a non-default value
* `client_profile_name` - an additional client profile will only be created if a name is provided
* `compression_enabled` - a random attribute demonstrating setting a non-default value

Other optional module input variables have the same name as the attributes of the underlying provider resource. If omitted then the default for the related resource attribute will be configured on the broker. For attributes and defaults, refer to the documentation of ["solacebroker_msg_vpn"](https://registry.terraform.io/providers/solaceproducts/solacebrokerappliance/latest/docs/resources/msg_vpn#optional), ["solacebroker_msg_vpn_acl_profile"](https://registry.terraform.io/providers/solaceproducts/solacebrokerappliance/latest/docs/resources/msg_vpn_acl_profile#optional) and ["solacebroker_msg_vpn_client_profile"](https://registry.terraform.io/providers/solaceproducts/solacebrokerappliance/latest/docs/resources/msg_vpn_client_profile#optional).

The module default for the `enabled` variable is true, which enables the message VPN and underlying resources.

### Output

The module `created_vpn` output refers to the created message VPN, `created_acl_profile` and `created_client_profile` refer to the additional ACL and client profiles included in the VPN.

## Created resources

This example will create following resources:

* `solacebroker_msg_vpn`
* `solacebroker_msg_vpn_acl_profile`
* `solacebroker_msg_vpn_client_profile`

Note that `default` ACL profile, client profile and client username objects will also be automatically created as part of the new VPN but are only available by referencing their name.

## Running the Example

### Access to a PubSub+ broker

If you don't already have access to a broker, refer to the [Developers page](https://www.solace.dev/) for options to get started.

### Sample source code

The sample is available from the module GitHub repo:

```bash
git clone https://github.com/SolaceProducts/terraform-solacebrokerappliance-service.git
cd examples/customized-acl-and-client-profiles
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

# terraform-hcloud-config

Terraform module to manage the Hetzner Cloud resources.

## Graph

<img alt="Graph" src="https://github.com/dhoppeIT/terraform-hcloud-config/blob/develop/rover.svg?raw=true" width="100%" height="100%">

## Usage

Copy and paste into your Terraform configuration, insert the variables and run ```terraform init```:

```hcl
module "hcloud_ssh_key" {
  source = "dhoppeIT/ssh_key/hcloud"

  name       = "terraform"
  public_key = "~/.ssh/id_terraform.pub"
}

module "hcloud_network" {
  source = "dhoppeIT/network/hcloud"

  name             = "private"
  ip_range_network = "10.0.0.0/16"

  type            = "cloud"
  ip_range_subnet = ["10.0.0.0/24"]
  network_zone    = "eu-central"
}

module "hcloud_firewall" {
  source = "dhoppeIT/firewall/hcloud"

  name = "default"
  rule = [
    {
      direction  = "in"
      protocol   = "icmp"
      source_ips = ["0.0.0.0/0"]
    },
    {
      direction  = "in"
      protocol   = "tcp"
      port       = "22"
      source_ips = ["0.0.0.0/0"]
    },
    {
      direction       = "out"
      protocol        = "icmp"
      destination_ips = ["0.0.0.0/0"]
    },
    {
      direction       = "out"
      protocol        = "tcp"
      port            = "53"
      destination_ips = ["0.0.0.0/0"]
    },
    {
      direction       = "out"
      protocol        = "udp"
      port            = "53"
      destination_ips = ["0.0.0.0/0"]
    },
    {
      direction       = "out"
      protocol        = "tcp"
      port            = "80"
      destination_ips = ["0.0.0.0/0"]
    },
    {
      direction       = "out"
      protocol        = "tcp"
      port            = "443"
      destination_ips = ["0.0.0.0/0"]
    }
  ]
}
```

<!--- BEGIN_TF_DOCS --->
<!--- END_TF_DOCS --->

## Authors

Created and maintained by [Dennis Hoppe](https://github.com/dhoppeIT/).

## License

Apache 2 licensed. See [LICENSE](https://github.com/dhoppeIT/terraform-hcloud-config/blob/develop/LICENSE) for full details.

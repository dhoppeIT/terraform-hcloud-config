module "hcloud_ssh_key" {
  source  = "dhoppeIT/ssh_key/hcloud"
  version = "~> 0.2"

  name       = "terraform"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC8tGf28OHlZaFvX7gPAlUrRI1f/dF45Wfwi8wn2qZ/ZwHTk6eV9lTgJ/NbCuykElib1d13hltDtEaPaGLKOkG/EHRVjirpnkIVdZYJ2XKcMc82kf5dsve9SZsJkrsbhqssA+CtEHHFECwCY6HFbwXxFfHNGl2F49CUITVWMzs2hxU0GtZfkXpF9GIjbm+FwWpLlYJMjbMZfVsFEHm6PJLzDnVOWtQEMgyO9zOyJScSK7lWqNTw7y8Fnrsb1lAbaqbJRPzuWGkPnfu46rINtqISvCQHfUpc1GLli+kYYmU/A3tPAM63R2Zd4BmOt/8PlNT32vBtLna8bbQfk6czcMv13gZtkQ36mGWrlNiawAKFlKMOhWoDxqPlZdPkBb/5EYVCQtro4LLmr+cji9pDLbZI3DHzvAFslciSXezN8/NVCCHawFV68SAU8397ph1vKIjdXWRBZ9l/hmif920f2ACxGkoCp8wC6+JnCpR2soo2Yu+l7RTxxpGZuJVarwgLVYaTXDOpyUyRSA1K8bnIjZNiR0/HCQtb94qWbXA6SrEJUNsqzR1ivvbnEMQ115Oi3uvBg/Los7FGKYVuyvz9Z64GC+MUrwxjdEEOsjWIY+A9dVautWkhVb3rXU/dmMbOnN3GHYw6VzcFOIY3wQgEihFAWv35RCbTmtXN906axvCLKw== Terraform"
}

module "hcloud_network" {
  source  = "dhoppeIT/network/hcloud"
  version = "~> 0.3"

  name             = "private"
  ip_range_network = "10.0.0.0/16"

  type            = "cloud"
  ip_range_subnet = ["10.0.0.0/24"]
  network_zone    = "eu-central"
}

module "hcloud_firewall" {
  source  = "dhoppeIT/firewall/hcloud"
  version = "~> 0.2"

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

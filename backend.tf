terraform {
  backend "remote" {
    organization = "dhoppeIT"

    workspaces {
      prefix = "hcloud-"
    }
  }
}

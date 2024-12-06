variable "settings" {
  type = map(object({
    hostname    = string
    template    = string
    target_node = string
    vmid        = number
    cores       = number
    memory      = number
    swap        = number
    disk_size   = string
    ip_address  = string
  }))
}

resource "proxmox_lxc" "basic" {
  for_each = var.settings

  vmid            = each.value.vmid
  target_node     = each.value.target_node
  hostname        = each.value.hostname
  ssh_public_keys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN35vH5w6YQXEAOvQMaiUhFyjZX3i+u7P1Q6B0xN5vPZ ichinose@MacBookNose.local"

  ostemplate = "local:vztmpl/${each.value.template}.tar.zst"


  cores  = each.value.cores
  memory = each.value.memory
  swap   = each.value.swap

  unprivileged = true

  rootfs {
    storage = "local-lvm"
    size    = each.value.disk_size
  }

  network {
    name     = "eth0"
    bridge   = "vmbr0"
    firewall = true
    ip       = "${each.value.ip_address}/24"
    ip6      = "auto"
  }
}

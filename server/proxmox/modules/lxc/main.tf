variable "settings" {
  type = map(object({
    hostname    = string
    clone       = string
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
  for_each    = var.settings
  vmid        = each.value.vmid
  target_node = each.value.target_node
  hostname    = each.value.hostname
  clone       = each.value.clone

  cores  = each.value.cores
  memory = each.value.memory
  swap   = each.value.swap

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

variable "settings" {
  type = map(object({
    vmid        = number
    target_node = string
    hostname    = string
    ssh_keys    = list(string)
    template    = string
    cores       = number
    memory      = number
    swap        = number
    disk_size   = string
    ip_address  = string
  }))
}

resource "proxmox_lxc" "basic" {
  for_each = var.settings

  vmid        = each.value.vmid
  target_node = each.value.target_node
  hostname    = each.value.hostname

  ssh_public_keys = join("\n", each.value.ssh_keys)

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

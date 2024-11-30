variable "vms" {
  type = map(object({
    hostname    = string
    target_node = string
    vmid        = number
    cores       = number
    memory      = number
    disk_size   = number
    ip_address  = string
    username    = string
    public_key  = string
  }))
}

resource "proxmox_vm_qemu" "k8s-vm" {
  for_each = var.vms

  name        = "k8s-vm-${each.value.hostname}"
  vmid        = each.value.vmid
  target_node = each.value.target_node
  clone       = "ubuntu-22.04-vm"
  os_type     = "cloud-init"
  boot        = "order=virtio0;net0"
  cores       = each.value.cores
  memory      = each.value.memory

  cloudinit_cdrom_storage = "local-lvm"

  disks {
    virtio {
      virtio0 {
        disk {
          storage = "local-lvm"
          size    = each.value.disk_size
        }
      }
    }
  }
  network {
    model    = "virtio"
    bridge   = "vmbr0"
    firewall = false
  }
  ipconfig0 = "ip=${each.value.ip_address}/24,gw=192.168.1.1"
  ciuser    = each.value.username
  sshkeys   = <<EOF
${each.value.public_key}
EOF
}

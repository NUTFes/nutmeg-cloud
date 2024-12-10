
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
  description = "A map of VM settings"
}

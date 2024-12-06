
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
  description = "A map of VM settings"
}

# 仮想マシンの作成
resource "proxmox_vm_qemu" "example_vm" {
  name        = "example-vm"
  target_node = "pve"

  # 仮想マシンの設定
  memory   = 512
  cpu      = 1
  disk {
    size = "10G"
  }
  network {
    model = "virtio"
  }

  # クローン元テンプレートの指定
  clone {
    template = "template-vm"
  }
}

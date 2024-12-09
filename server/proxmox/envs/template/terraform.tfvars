settings = {
  "vm1" = {
    # ディレクトリの名前と同じにする
    hostname    = "プロダクト名"
    # 基本的に固定
    template    = "ubuntu-24.04-standard_24.04-2_amd64"
    # どのサーバに作成するかを指定する
    # pve02~06のどれかを指定する
    target_node = "pve0x"
    # 基本的に固定
    username    = "nutmeg"
    # 作成するVMのID
    # 既存のVMと重複しないようにする
    # 先頭はPVEのIDと同じにする
    # 例：pveがpve02の場合、201,202,203...とする
    vmid        = xxx
    # CPUの数
    cores       = 1
    # メモリのサイズ
    memory      = 1024
    # スワップのサイズ
    swap        = 1024
    # ディスクのサイズ
    disk_size   = "16G"
    # IPアドレス
    # /24なので、最後の数字を変える
    ip_address  = "192.168.1.xxx"
  }
}



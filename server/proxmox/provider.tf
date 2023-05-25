# Terraformのプロバイダ設定
provider "proxmox" {
  pm_api_url     = "https://your-proxmox-server/api2/json"
  pm_user        = "your-username@pam"
  pm_password    = "your-password"
  insecure_https = false
}

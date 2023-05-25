# Terraformのプロバイダ設定
provider "cloudflare" {
  email     = "your-email@example.com"
  api_key   = "your-cloudflare-api-key"
}

# CloudflareのDNSレコード設定
resource "cloudflare_record" "example" {
  zone_id = "your-zone-id"
  name    = "example.com"
  value   = "192.0.2.1"
  type    = "A"
  ttl     = 3600
}

# Cloudflareの設定変更（例：Always Use HTTPSを有効化）
resource "cloudflare_zone_settings_override" "example" {
  zone_id = "your-zone-id"
  settings {
    always_use_https = "on"
  }
}

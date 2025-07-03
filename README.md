# 🔐 Auto Backup Script to MEGA with Discord Notifications

This script automatically creates a ZIP backup of `/var/www/html`, uploads it to your MEGA.nz account, and sends a status notification to a Discord channel using a webhook.

Perfect for securing website data on a remote Ubuntu server — safely, automatically, and quietly.

---

## 🚀 Features

- 📦 Compresses `/var/www/html` into a date-stamped `.zip` file
- ☁️ Uploads securely to your `MEGA.nz` cloud
- 📬 Sends backup status (success/failure) to Discord via webhook
- 🧹 Cleans up temporary files
- 🔁 Works with `cron` for full automation

---

## ⚙️ Requirements

Before you begin, make sure your Ubuntu VPS has the following installed:

- `rclone` (for Mega cloud upload)
- `zip` (for compression)
- `curl` (for Discord webhook)

---

## 🛠️ 1. Install Dependencies

```bash
sudo apt update
sudo apt install zip curl -y
curl https://rclone.org/install.sh | sudo bash

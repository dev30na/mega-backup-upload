#!/bin/bash

# Variables
DATE=$(date +%F)
SRC="/var/www/html" # Folder Backup
ZIP_FILE="/tmp/html_backup_$DATE.zip" # don't touch 
DEST="mega:/VeePass/html_backup_$DATE.zip" #Set folder in MEGA
WEBHOOK_URL="" # Set Webhook URL discord here

# Compress the source directory
if zip -r "$ZIP_FILE" "$SRC" > /dev/null 2>&1; then
    MSG_ZIP="✅ ZIP file created successfully."
else
    MSG_ZIP="❌ Failed to create ZIP file."
fi

# Upload to Mega using exact path
if rclone copyto "$ZIP_FILE" "$DEST" --progress > /dev/null 2>&1; then
    MSG_UPLOAD="✅ Backup uploaded to MEGA successfully. (git: dev30na)"
else
    MSG_UPLOAD="❌ Failed to upload backup to MEGA. (git: dev30na)"
fi

# Send log to Discord
curl -H "Content-Type: application/json" \
     -X POST \
     -d "{\"content\": \"📦 Backup Report [$DATE]:\n$MSG_ZIP\n$MSG_UPLOAD\"}" \
     "$WEBHOOK_URL"

# Clean up ZIP file
rm -f "$ZIP_FILE"

#!/bin/bash

echo ""
echo "$0: Start on $(date)..."

if [ -z "$BACKUP_DIR" ]
then
  echo "Need environment var: \$BACKUP_DIR"
  exit 1
fi

GDRIVE_BACKUP_DIR="${BACKUP_DIR}/cloud/gdrive"

rclone sync --drive-auth-owner-only --exclude 'Plex Cloud Sync/*' gdrive: $GDRIVE_BACKUP_DIR

echo "$0: Finished on $(date)."

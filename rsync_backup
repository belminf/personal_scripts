#!/usr/bin/env bash

# Get import dir
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

# Source config
source "${SCRIPT_DIR}/environment"

# Log to backup log
exec > $BACKUP_LOG 2>&1

echo "$0: Start on $(date)..."

echo "$0: Going through sync scripts..."
for s in ${SCRIPT_DIR}/sync/*.sh
do
  $s
done

echo "$0: Running rsync.."
cd $BACKUP_SOURCE
rsync -avh --delete --exclude-from $BACKUP_EXCEPTIONS . $BACKUP_TARGET

echo "$0: Finished on $(date)."

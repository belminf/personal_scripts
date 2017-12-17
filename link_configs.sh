#!/bin/bash

if [ -z "$BACKUP_DIR" ]
then
  echo "Need environment var: \$BACKUP_DIR"
  exit 1
fi

CONFIG_BACKUP_DIR="${BACKUP_DIR}/configs"

# Go through all modified configs
for f in $(pacman -Qii | awk '/^MODIFIED/ {print $2}')
do

  # Print file
  echo "Linking config ${f}..."

  # Create directory in backup
  mkdir -p ${CONFIG_BACKUP_DIR}$(dirname $f)

  # Create a symlink
  ln -sf $f ${CONFIG_BACKUP_DIR}${f}
done

# TODO - Way to list other config files manually

#!/usr/bin/env bash

# Break on error
set -e

# Get import dir
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

# Source config
source "${SCRIPT_DIR}/environment"

# Log to updates log
exec > >(tee -a $UPDATE_LOG) 2>&1

# Log start
echo "$0: Start on $(date)..." >> $UPDATE_LOG

# Create snapshot LV
echo "Creating LVM snapshot..."
sudo lvcreate --snapshot -L 2GB -n ${ROOT_LV}-snap /dev/${VG}/${ROOT_LV} || (echo -e "\nRe-run after cleanup: sudo lvremove $VG/${ROOT_LV}-snap" && exit 1)

# Create snapshot file
echo "Exporting snapshot to file..."
echo "$(date): exporting snapshot..." >> $UPDATE_LOG
sudo dd if=/dev/${VG}/${ROOT_LV}-snap bs=100M | gzip -c -9 > ${SNAPSHOT_DIR}/${ROOT_LV}-snap-$(date +"%F").gz
echo "$(date): finished exporting snapshot." >> $UPDATE_LOG

# Remove snapshot LV
echo "Deleting LVM snapshot.."
sudo lvremove -y ${VG}/${ROOT_LV}-snap

# Run the update
echo "Pacman update..."
echo "$(date): starting package update..." >> $UPDATE_LOG
yes | sudo pacman -Syu
echo "$(date): finished pacman update." >> $UPDATE_LOG

# Go through AUR dirs
echo "AUR upgrade..."
for this_aur in ${AUR_DIR}/*
do
  cd ${this_aur}
  git pull > /dev/null
  yes | makepkg -si
done

# Log finish
echo "$0: Finished on $(date)." >> $UPDATE_LOG

# personal_scripts

A collection of utility scripts I use. Archlinux is my primary distro so a lot of this is catered to that.

## Setup
Create `.environment` based off `.environment.example`

## Configuring scripts

### rsync_backup
Copies local files to rsync.net.

Configure applicable environment variables (`RSYNC_*`) in `.environment`

### backup_gdrive
Backs up Google Drive.

1. Install `rlcone`
2. Configure source via `rclone config`
3. Configure applicable environment variables (`GDRIVE_*`) in `.environment`

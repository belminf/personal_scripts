# personal_scripts

A collection of utility scripts I use. Archlinux is my primary distro so a lot of this is catered to that.

## Setup
Create `.environment` based off `.environment.example`

Also requires `realpath` binary in the `PATH`. In Archlinux, this is provided by `core/coreutils` package.

# Scripts

## arch_link_configs
Create symlinks to configuration files that have changed since pacman packages were installed.

Configure target via `CONFIG_BACKUP_DIR` in `.environment`.

## arch_update
Updates pacman packages and AUR packages. As a precaution, dumps a snapshot of the root logical volume.

Configure applicable environment variables (`ARCH_UPDATE_*`) in `.environment`

## rsync_backup
**Requires:** `rsync`

Copies local files to rsync.net.

Configure applicable environment variables (`RSYNC_*`) in `.environment`

## backup_gdrive
**Requires:** `rclone`

Backs up Google Drive.

1. Configure source via `rclone config`
2. Configure applicable environment variables (`GDRIVE_*`) in `.environment`

## backup_gmail
**Requires:** `getmail`

Wrapper for `getmail` that I use to backup Gmail. All configuration in `~/.getmail`. Example of config:

```
[destination]
type = Maildir
path = ~/backups/email/johndoe@gmail.com/

[retriever]
type = SimpleIMAPSSLRetriever
server = imap.gmail.com
mailboxes = ("Inbox", "[Gmail]/Sent Mail")
username = johndoe@gmail.com
password = [APP PASS via: https://myaccount.google.com/apppasswords]

[options]
verbose = 1
message_log = ~/backups/email/johndoe@gmail.com/log
read_all = false
delivered_to = false
received = false
```


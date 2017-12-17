#!/bin/sh

# Configure in: ~/.getmail 

## Example:
#[destination]
#type = Maildir
#path = ~/backups/email/johndoe@gmail.com/
#
#[retriever]
#type = SimpleIMAPSSLRetriever
#server = imap.gmail.com
#mailboxes = ("Inbox", "[Gmail]/Sent Mail")
#username = johndoe@gmail.com
#password = [APP PASS via: https://myaccount.google.com/apppasswords]
#
#[options]
#verbose = 1
#message_log = ~/backups/email/johndoe@gmail.com/log
#read_all = false
#delivered_to = false
#received = false

echo ""
echo "$0: Start on $(date)..."

getmail

echo "$0: Finished on $(date)."

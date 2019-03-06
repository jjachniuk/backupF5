#!/bin/bash

today_ucs="`date "+%m_%d_%y"`.ucs"

tmsh save /sys ucs Backup_LNBIGIPA$today_ucs

ftp -n <<EOF
open ftp.com
user "user" "pass"
cd backup
cd F5
binary
lcd /var/local/ucs
put Backup_LNBIGIPA$today_ucs
bye
EOF
rm /var/local/ucs/Backup_LNBIGIPA$today_ucs

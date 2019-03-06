#!/bin/bash

today_ucs="`date "+%m_%d_%y"`.ucs"

tmsh save /sys ucs Backup_LNBIGIPA$today_ucs

ftp -n <<EOF
open jerftpina.muni.jerusalem.muni.il
user "kikardom\tasht" 123123
cd GibConf
cd F5
binary
lcd /var/local/ucs
put Backup_LNBIGIPA$today_ucs
bye
EOF
rm /var/local/ucs/Backup_LNBIGIPA$today_ucs

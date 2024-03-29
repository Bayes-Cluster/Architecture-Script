#!/bin/bash

# 0. root (sudo su)
# 1. create the `log` file
# 2. change to file's owner and permission


mkdir -p /var/log/usermonitor/
echo usermonitor >/var/log/usermonitor/usermonitor.log
chown nobody:nogroup /var/log/usermonitor/usermonitor.log
chmod 002 /var/log/usermonitor/usermonitor.log
chattr +a /var/log/usermonitor/usermonitor.log

# add this two scripts to `/etc/profile`:

echo "export HISTORY_FILE=/var/log/usermonitor/usermonitor.log" >> /etc/profile
echo "export PROMPT_COMMAND='{ date "+%y-%m-%d %T ##### $(who am i |awk "{print \$1\" \"\$2\" \"\$5}") #### $(whoami) #### $(history 1 | { read x cmd; echo "$cmd"; })"; } >>$HISTORY_FILE'" >> /etc/profile

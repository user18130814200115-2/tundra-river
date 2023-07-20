#!/bin/sh

[ $(lswt | grep -c "\-\-af") -eq 0 ] && exit

data=$(date +'%H:%M\\r' | cat \
    /tmp/yambardate\
    -\
    /tmp/yambarmail\
    /tmp/yambaramp\
    /tmp/yambarbitcoin\
    /tmp/yambargovernor\
    /tmp/yambarbattery\
    /tmp/yambarwifi\
    | cut -d"|" -f3 | xargs)
notify-send.sh -t 0 -a bar -R /tmp/yambarnotify "$data"

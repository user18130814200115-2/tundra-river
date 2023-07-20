#!/bin/sh

service=$(ls "$PASSWORD_STORE_DIR" | sed 's/\.gpg//g' | launcher)
[ -z $service ] && exit 
pass=$(pass otp $service)

auth() {
    if [ -z $pass ]; then
	footclient -a float -o initial-window-size-pixels=228x132 sh -c "su -l user exit"
	pass=$(pass otp $service)
        auth
    fi
}

auth

notify-send.sh -i stock_lock "Pass $service" "$pass"
clipboard=$(wl-paste)
wl-copy "$pass"
sleep 5
[ $(pgrep -c otp.sh) -eq 1 ] && wl-copy "$clipboard"

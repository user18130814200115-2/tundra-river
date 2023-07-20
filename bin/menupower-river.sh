#!/bin/sh

yad --undecorated --button yad-close  --button='Lock!lock:5'  --button='Logout!document-export:6' --button='Reboot!amarok_playlist_refresh:3' --button yad-ok --fixed -center --title "Powermenu" --text "Shutdown will automatically commence in 60 seconds"  --timeout 60 --buttons-layout=center --timeout-indicator bottom

case $? in
	4)doas poweroff;;
	70)doas poweroff;;
	3)doas reboot;;
	6)riverctl exit;;
	5)lock;;
esac

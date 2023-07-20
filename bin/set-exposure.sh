#!/bin/sh

device="/dev/video3"
mode=$(v4l2-ctl -d /dev/video3 -C exposure_auto)

if [ "$mode" != "exposure_auto: 1" ]; then
    v4l2-ctl -d $device -c exposure_auto=1
    v4l2-ctl -d $device -c exposure_absolute=300
else
    current=$(v4l2-ctl -d $device -C exposure_absolute | cut -d " " -f 2)
    new=$(printf "$current $1 2" | xargs expr)
    v4l2-ctl -d $device -c exposure_absolute=$new
fi



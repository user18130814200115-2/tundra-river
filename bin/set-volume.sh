#!/bin/sh

pactl set-sink-volume "@DEFAULT_SINK@" "$1"

current=$(pactl list sinks | grep "Volume: front-left" | grep -o "[0-9]*%" | head -n 1)
volume-notify.sh "$current"

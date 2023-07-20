#!/bin/sh

active=$(pactl list sinks  | grep "Active Port: " | cut -d: -f2)
sink="alsa_output.platform-es8316-sound.stereo-fallback"

if [ "$active" = " analog-output-speaker" ]; then
    pactl set-sink-port "$sink" analog-output-headphones
    active=" analog-output-headphones"
else
    pactl set-sink-port "$sink" analog-output-speaker
    active=" analog-output-speaker"
fi

current=$(pactl list sinks | grep "Volume: front-left" | grep -o "[0-9]*%" | head -n 1)

printf "$active" > ~/.cache/volume
volume-notify.sh "$current"

#!/bin/sh

[ $(wlr-randr | grep -c "DP") -gt 1 ] &&\
    wlr-randr --output eDP-1 --off --output DP-1 --on ||\
    wlr-randr --output eDP-1 --on

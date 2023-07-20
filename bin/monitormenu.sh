#!/bin/sh

selection=$(printf "external\ninternal\nboth\nneither" | launcher)
external="DP-1"
internal="eDP-1"

case $selection in
    external)
	wlr-randr --output eDP-1 --off 
	wlr-randr --output DP-1 --on 
    ;;
    internal)
	wlr-randr --output eDP-1 --on
	wlr-randr --output DP-1 --off 
    ;;
    both)
	wlr-randr --output eDP-1 --on
	wlr-randr --output DP-1 --on
    ;;
    neither)
	 wlr-randr --output eDP-1 --off 
	 wlr-randr --output DP-1 --off 
    ;;
esac


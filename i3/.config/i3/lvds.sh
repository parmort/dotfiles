#!/bin/bash

xrandr --output LVDS-1 --primary --mode 1280x800 --pos 0x0 --rotate normal --output SVIDEO-1 --off --output HDMI-1 --off --output VGA-1 --off
i3-msg 'restart'

#!/usr/bin/env bash


for monitor in $(herbstclient list_monitors | cut -d: -f1) ; do
    # start it on each monitor
    "$panel" $monitor &
done

#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Is a VGA monitor connected
# IS_VGA=eval "xrandr --listactivemonitors | grep -i VGA-1"

# Launch bar1 and bar2
polybar top &
polybar bottom &
polybar vga &

# if [ IS_VGA -ne "" ]
# then
 #  polybar vga &
# fi

echo "Bars launched..."

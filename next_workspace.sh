#!/bin/sh
total=$(expr $(wmctrl -d | wc -l) - 1)
current=$(wmctrl -d | sed -n 's/^\([0-9]\+\) *\*.*/\1/p')
if [ -z "$total" ] || [ -z "$current" ]; then
  echo 1>&2 "$0: Could not obtain workspace information!"
  exit 2
fi
target=$(($current+1))
if [ $target = $total ]; then
  target=0
fi
wmctrl -s $target

sleep 0.1s

/home/danilo/scripts/dmenu/dzen_current_window.sh &

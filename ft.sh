#!/bin/bash

sleep 0.01s

current_id=$(/home/danilo/scripts/get_current_window.sh)
current_id=$(echo $current_id | tr ',' ' ' | sed 's/^0x//')

current_window=$(wmctrl -dliGu | grep $current_id)
sublime=$(echo $current_window | grep -i 'sublime')

echo "sublime: ${sublime}"

# se sublime é '' entao é tilix
if [ "$sublime" == "" ]; then
  if [ "$1" == "1" ]; then
    xdotool key ctrl+shift+KP_1
  fi

  if [ "$1" == "2" ]; then
    xdotool key ctrl+shift+KP_2
  fi

  if [ "$1" == "3" ]; then
    xdotool key ctrl+shift+KP_3
  fi

  if [ "$1" == "4" ]; then
    xdotool key ctrl+shift+KP_4
  fi
  exit
fi

if [ "$1" == "1" ]; then
  xdotool key ctrl+shift+KP_4
fi

if [ "$1" == "2" ]; then
  xdotool key ctrl+shift+KP_5
fi

if [ "$1" == "3" ]; then
  xdotool key ctrl+shift+KP_1
fi

if [ "$1" == "4" ]; then
  xdotool key ctrl+shift+KP_2
fi

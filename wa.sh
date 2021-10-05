#!/bin/bash

while read -r line ; do
  workspace_monitor=$(echo $line | awk '{print $NF}' | grep 'm1')
  if [ "$workspace_monitor" ]
  then
    lines="$line\n$lines"
  fi
done < <(cat /home/danilo/scripts/dmenu/list_windows)

choice=$(echo -e "$lines" | awk '{ s = ""; for (i = 2; i <= NF; i++) s = s $i " "; print s }' | dmenu -i -l 20 -b -m 2 -fn Monospace-16:normal)
if [ "$choice" == "" ]; then
  exit
fi

choice=$(echo $choice | tr -d '\n')
wid=$(echo -e "$lines" | grep "$choice" | awk '{ print $1 }')
monitor_workspace=$(echo -e "$lines" | grep "$choice" | awk '{ print $NF }')
workspace=$(expr ${monitor_workspace:1:1} - 1)

wmctrl -s $workspace && sleep 0.01s
wmctrl -i -a $wid

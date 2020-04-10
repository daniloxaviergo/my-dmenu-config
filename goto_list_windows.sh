#!/bin/bash

# got windows in file

echo $1
position=$(echo $1 | awk '{print $1}')
classwin=$(echo $1 | awk '{print $2}')

window_id=$(cat /home/danilo/scripts/dmenu/list_windows | grep $position | grep $classwin | awk '{print $1}')
if [ "$window_id" == "" ]; then
  exit
fi

workspace=$(echo "$position" | awk '{print substr($0,2,1)}')
workspace=$(expr "$workspace" - 1)

wmctrl -s $workspace && sleep 0.01s
wmctrl -i -a $window_id

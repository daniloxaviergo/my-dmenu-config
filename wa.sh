#!/bin/bash

# janelas do primeiro monitor workspace atual

screen=3840
topscreen=414

if [ "$1" == "" ]; then
  cw=$(wmctrl -d | sed -n 's/^\([0-9]\+\) *\*.*/\1/p') # current workspace
else
  cw=$1
fi

wid=''
lines=''
while read -r line ; do
  width=$(echo $line | awk '{ print $3 }')
  top=$(echo $line | awk '{ print $4 }')
  workspace=$(echo $line | awk '{ print $2 }')
  if [ "$width" -lt "$screen" ] && [ "$width" -gt -9000 ] && [ "$top" -gt "$topscreen" ]
  then
    if [ "$workspace" = "$cw" ] || [ "$cw" = "all" ]
    then
      if [ -z "$wid" ]
      then
        linne=$(echo $line | sed 's/[\]//g' | awk '{ s = ""; for (i = 9; i <= NF; i++) s = s $i " "; print $1, $7, s }')
        windowid=$(echo $line | awk '{ print $1 }')
        wwworkspace=$(echo $line | awk '{ print $2 }')
        title=$(echo $line | sed 's/[\]//g' | awk '{ s = ""; for (i = 8; i <= NF; i++) s = s $i " "; print $7, s }')
        linne="$windowid k$((wwworkspace+1)) $title"
        lines="$linne\n$lines"

        # old
        # line=$(echo $line | sed 's/[\]//g' | awk '{ s = ""; for (i = 9; i <= NF; i++) s = s $i " "; print $1, $7, s }')
        # lines="$line\n$lines"
      fi
    fi
  fi
done < <(wmctrl -dliGx)

choice=$(echo -e "$lines" | awk '{ s = ""; for (i = 2; i <= NF; i++) s = s $i " "; print s }' | dmenu -i -l 20 -b -m 2 -fn Monospace-16:normal)
if [ "$choice" == "" ]; then
  exit
fi

wid=$(echo -e "$lines" | grep "$choice" | awk '{ print $1 }')
wworkspace=$(wmctrl -dliGx | grep "$wid" | awk '{ print $2 }')
wmctrl -s $wworkspace && sleep 0.01s
wmctrl -i -a $wid

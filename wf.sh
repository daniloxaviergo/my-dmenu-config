#!/bin/bash

# janelas do quarto monitor workspace atual

bscreen=6777 # begin screen
escreen=10560 # end screen
topscreen=1349  # top porque tem monitor no alto


if [ "$1" == "" ]; then
  cw=$(wmctrl -d | sed -n 's/^\([0-9]\+\) *\*.*/\1/p') # current workspace
else
  cw=$1
fi


wid=''
lines=''
while read -r line ; do
  # echo $line
  width=$(echo $line | awk '{ print $3 }')
  top=$(echo $line | awk '{ print $4 }')
  workspace=$(echo $line | awk '{ print $2 }')
  if [ "$width" -gt "$bscreen" ]
  then
    if [ "$width" -lt "$escreen" ]
    then
      if [ "$top" -lt "$topscreen" ]
      then
        if [ "$workspace" -eq "$cw" ]
        then
          if [ -z "$wid" ]
          then
            line=$(echo $line | sed 's/[\]//g' | awk '{ s = ""; for (i = 9; i <= NF; i++) s = s $i " "; print $1, $7, s }')
            lines="$line\n$lines"
          fi
        fi
      fi
    fi    
  fi
done < <(wmctrl -dliGx)

choice=$(echo -e "$lines" | awk '{ s = ""; for (i = 2; i <= NF; i++) s = s $i " "; print s }' | dmenu -i -l 20 -b -m 3 -fn Monospace-16:normal)
if [ "$choice" == "" ]; then
  exit
fi

wid=$(echo -e "$lines" | grep "$choice" | awk '{ print $1 }')
wmctrl -s $cw && sleep 0.01s
wmctrl -i -a $wid

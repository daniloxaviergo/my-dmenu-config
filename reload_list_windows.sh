#!/bin/bash

# save windows in file

monitor_window () {
  left=$1
  top=$2
  
  if [ "$left" -lt "10560" ] && [ "$top" -gt "1349" ]
  then
    monitor="k$(expr $workspace + 1)m3_md"
  
  elif [ "$left" -lt "3840" ] && [ "$top" -gt "400" ]
  then
    monitor="k$(expr $workspace + 1)m1_ma"

  elif [ "$left" -lt "7680" ] && [ "$top" -gt "400" ]
  then
    monitor="k$(expr $workspace + 1)m2_ms"

  elif [ "$left" -lt "10560" ] && [ "$top" -gt "-1" ]
  then
    monitor="k$(expr $workspace + 1)m4_mf"
  fi
}


wid=''
lines=''
while read -r line ; do
  width=$(echo $line | awk '{ print $3 }')
  top=$(echo $line | awk '{ print $4 }')
  workspace=$(echo $line | awk '{ print $2 }')
  if [ "$workspace" -gt "-1" ]
  then
    if [ -z "$wid" ]
    then
      line=$(echo $line | sed 's/[\]//g' | awk '{ s = ""; for (i = 9; i <= NF; i++) s = s $i " "; print $1, $7, s }')
      monitor_window $width  $top
      lines="$line$monitor\n$lines"
    fi
  fi
done < <(wmctrl -dliGx)

echo "" > /home/danilo/scripts/dmenu/list_windows
echo -e $lines >> /home/danilo/scripts/dmenu/list_windows
exit

#!/bin/bash


monitor_window () {
  left=$1
  top=$2
  
  if [ "$left" -lt "10560" ] && [ "$top" -gt "1349" ]
  then
    monitor='m3_md'
  
  elif [ "$left" -lt "3840" ] && [ "$top" -gt "400" ]
  then
    monitor='m1_ma'

  elif [ "$left" -lt "7680" ] && [ "$top" -gt "400" ]
  then
    monitor='m2_ms'

  elif [ "$left" -lt "10560" ] && [ "$top" -gt "-1" ]
  then
    monitor='m4_mf'
  fi
}


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
  if [ "$workspace" -eq "$cw" ]
  then
    if [ -z "$wid" ]
    then
      line=$(echo $line | sed 's/[\]//g' | awk '{ s = ""; for (i = 9; i <= NF; i++) s = s $i " "; print $1, $7, s }')
      monitor_window $width  $top
      lines="$line$monitor\n$lines"
    fi
  fi
done < <(wmctrl -dliGx)

choice=$(echo -e "$lines" | awk '{ s = ""; for (i = 2; i <= NF-1; i++) s = s $i " "; print $NF, s }' | dmenu -i -l 20 -b -m 3 -fn Monospace-16:normal)
if [ "$choice" == "" ]; then
  exit
fi

choice=$(echo $choice | awk '{ s = ""; for (i = 2; i <= NF-1; i++) s = s $i " "; print s }')
wid=$(echo -e "$lines" | grep "$choice" | awk '{ print $1 }')
wmctrl -s $cw && sleep 0.01s
wmctrl -i -a $wid

#!/bin/bash

generated_output() {
    # endless loop
    local date=$(date +'%a %b %d')
    local time=$(date +'%H:%M:%S')

    local text=""
    text+="^bg()^fg()  "
    text+="^bg()^fg()  $1  ^bg()"
    text+="^bg()^fg()  "
    
    echo $text

    sleep 0.5s
}

pkill dzen2

# pegar as coordenadas
# watch -t -n 0.0001 xdotool getmouselocation

# qual monitor será exibido
if [ "$1" == "1" ]; then
  generated_output $2 | dzen2 -x 0 -y 415 -fn 30 -h 70 -w 3840 &
fi

if [ "$1" == "2" ]; then
  generated_output $2 | dzen2 -x 3840 -y 415 -fn 30 -h 70 -w 3840 &
fi

if [ "$1" == "3" ]; then
  generated_output $2 | dzen2 -x 7681 -y 1350 -fn 30 -h 70 -w 2890 &
fi

if [ "$1" == "4" ]; then
  generated_output $2 | dzen2 -x 7681 -y 0 -fn 30 -h 70 -w 2400 &
fi


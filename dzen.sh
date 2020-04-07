#!/bin/bash

generated_output() {
    # endless loop
    local date=$(date +'%a %b %d')
    local time=$(date +'%H:%M:%S')

    local text=""
    text+="^bg(#2196f3)^fg(#000000) $(watson status -p | awk '{print $1}')  $(watson status -t) "
    text+="^bg()^fg()  "
    text+="^bg(#fac000)^fg(#000000) $(watson status -e) "
    text+="^bg()^fg()  "
    text+="^bg(#f44336)^fg(#000000)  $time  ^bg(#000000)"
    
    echo $text

    sleep 1m
}

pkill dzen2
generated_output | dzen2 -x 3840 -y 415 -fn 30 -h 70 -w 3840

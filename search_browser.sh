#!/bin/bash

URL='https://www.google.com/search?q='

QUERY=$(echo '' | dmenu -p "Search:" -m 3 -fn Monospace-16:normal -b)
if [ -n "$QUERY" ]; then

  if [ "$1" == "chromium" ]; then
    chromium "${URL}${QUERY}"
  fi

  if [ "$1" == "chrome" ]; then
    /opt/google/chrome/google-chrome "${URL}${QUERY}"
  fi
fi

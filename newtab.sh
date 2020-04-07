#!/bin/bash

list=("app.reev.co - chromium - https://app.reev.co/dashboard
staging.reev.co - chromium - https://staging.reev.co/dashboard
trello.com - chrome - https://trello.com/b/EdS47ZHS/cs-desenvolvimento
heroku.com - chrome - https://dashboard.heroku.com/apps
circleci.com - chrome - https://circleci.com/gh/outbound-marketing
github.api - chrome - https://github.com/outbound-marketing/reev-api
github.ui - chrome - https://github.com/outbound-marketing/reev-ui
github.leadgen - chrome - https://github.com/outbound-marketing/reev-leadgen")

choice=$(echo -e "$list" | dmenu -i -l 20 -b -m 3 -fn Monospace-16:normal)

if [ "$choice" == "" ]; then
  exit
fi

url=$(echo $choice | awk '{ print $5 }')
browser=$(echo $choice | awk '{ print $3 }')

if [ "$browser" == "chromium" ]; then
  wmctrl -s 1 && sleep 0.01s
  chromium "${url}" &
fi

if [ "$browser" == "chrome" ]; then
  wmctrl -s 0 && sleep 0.01s
  /opt/google/chrome/google-chrome "${url}" &
fi

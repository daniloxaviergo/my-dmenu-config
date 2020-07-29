#!/bin/bash

# ncsearch -> chromium
# ngsearch -> chrome

bash /home/danilo/scripts/dmenu/dzen.sh &

list=(".s .sa .s1 - sublime1
.ss .ss .s2 - sublime2
.sss .sd .s3 - sublime3
.r .ra .r1 - tilix1
.rr .rs .r2 - tilix2
.rrr .rd .r3 - tilix3
.g .ga .g1 - chromiun1
.gg .gs .g2 - chromiun2
.ggg .gf .g3 - chromiun3
wa w1 - window m1
ws w2 - window m2
wd w3 - window m3
wf w4 - window m4
kwa ka wa .wa - window(S) workspace 1
kws ks ws .ws - window(S) workspace 2
kwd kd wd .wd - window(S) workspace 3
kwaa kw11 k1m1 - workspace 1 monitor 1
kwsa kw21 k2m1 - workspace 2 monitor 1
kwda kw31 k3m1 - workspace 3 monitor 1
kwas kw12 k1m2 - workspace 1 monitor 2
kwss kw22 k2m2 - workspace 2 monitor 2
kwds kw32 k3m2 - workspace 3 monitor 2
kwad kw13 k1m3 - workspace 1 monitor 3
kwsd kw23 k2m3 - workspace 2 monitor 3
kwdd kw33 k3m3 - workspace 3 monitor 3
kwaf kw14 k1m4 - workspace 1 monitor 4
kwsf kw24 k2m4 - workspace 2 monitor 4
kwdf kw34 k3m4 - workspace 3 monitor 4
.rft1 rf1 rfa - tilix1 painel 1
.rft2 rf2 rfs - tilix1 painel 2
.rft3 rf3 rfd - tilix1 painel 3
.rft4 rf4 rff - tilix1 painel 4
.sft1 sf1 sfa - sublime1 painel 1
.sft2 sf2 sfs - sublime1 painel 2
.sft3 sf3 sfd - sublime1 painel 3
.sft4 sf4 sff - sublime1 painel 4
ft1 f1 fa fta - focus painel 1
ft2 f2 fs fts - focus painel 2
ft3 f3 fd ftd - focus painel 3
ft4 f4 ff ftf - focus painel 4
.ka k1 - workspace1
.ks k2 - workspace2
.kd k3 - workspace3
ncsearch - search chromium
ngsearch - search chrome
newtab - tabs open tab
dxpaste
dxpaste2
.musicp - toggle pause/start
.slack - set focus slack
.music - set focus rhythmbox
.clock - set focus clock
.zapzap - whatsapp
.gmail
.heroku
.hubspot
.circle
.jira
.amazon aws
a - chrome m2
aa - chrome m1
aaa - chrome beta m2
.skip add
.reload list windows
.ui1 localhost ui
.ui2 localhost ui2")

list_windows="$(cat /home/danilo/scripts/dmenu/list_windows | awk '{ s = ""; for (i = 2; i <= NF-1; i++) s = s $i " "; print $NF, s }')"
nlist=$list$list_windows

choice=$(echo -e "$nlist" | dmenu -i -l 20 -b -m 3 -fn Monospace-16:normal)
func=$(echo $choice | awk '{ print $1 }')

if [ "$func" == ".r" ]; then
  $(/home/danilo/scripts/goto_saved_window.py s6)
fi

if [ "$func" == ".rr" ]; then
  $(/home/danilo/scripts/goto_saved_window.py s9)
fi

if [ "$func" == ".rrr" ]; then
  $(/home/danilo/scripts/goto_saved_window.py s3)
fi

if [ "$func" == ".s" ]; then
  $(/home/danilo/scripts/goto_saved_window.py s5)
fi

if [ "$func" == ".ss" ]; then
  $(/home/danilo/scripts/goto_saved_window.py s8)
fi

if [ "$func" == ".sss" ]; then
  $(/home/danilo/scripts/goto_saved_window.py s2)
fi

if [ "$func" == ".g" ]; then
  $(/home/danilo/scripts/goto_saved_window.py s4)
fi

if [ "$func" == ".gg" ]; then
  $(/home/danilo/scripts/goto_saved_window.py s7)
fi

if [ "$func" == ".ggg" ]; then
  $(/home/danilo/scripts/goto_saved_window.py s1)
fi

if [ "$func" == "wa" ]; then
  bash /home/danilo/scripts/dmenu/wa.sh
fi

if [ "$func" == "ws" ]; then
  bash /home/danilo/scripts/dmenu/ws.sh
fi

if [ "$func" == "wd" ]; then
  bash /home/danilo/scripts/dmenu/wd.sh
fi

if [ "$func" == "wf" ]; then
  bash /home/danilo/scripts/dmenu/wf.sh
fi

if [ "$func" == ".ka" ]; then
  wmctrl -s 0
fi

if [ "$func" == ".ks" ]; then
  wmctrl -s 1
fi

if [ "$func" == ".kd" ]; then
  wmctrl -s 2
fi

if [ "$func" == "dxpaste" ]; then
  /home/danilo/scripts/select_copy.py &
fi

if [ "$func" == "dxpaste2" ]; then
  xfce4-popup-clipman
fi

if [ "$func" == "ncsearch" ]; then
  bash /home/danilo/scripts/dmenu/search_browser.sh chromium
fi

if [ "$func" == "ngsearch" ]; then
  bash /home/danilo/scripts/dmenu/search_browser.sh chrome
fi

if [ "$func" == "kwaa" ]; then
  bash /home/danilo/scripts/dmenu/wa.sh 0
fi

if [ "$func" == "kwsa" ]; then
  bash /home/danilo/scripts/dmenu/wa.sh 1
fi

if [ "$func" == "kwda" ]; then
  bash /home/danilo/scripts/dmenu/wa.sh 2
fi

if [ "$func" == "kwas" ]; then
  bash /home/danilo/scripts/dmenu/ws.sh 0
fi

if [ "$func" == "kwss" ]; then
  bash /home/danilo/scripts/dmenu/ws.sh 1
fi

if [ "$func" == "kwds" ]; then
  bash /home/danilo/scripts/dmenu/ws.sh 2
fi

if [ "$func" == "kwad" ]; then
  bash /home/danilo/scripts/dmenu/wd.sh 0
fi

if [ "$func" == "kwsd" ]; then
  bash /home/danilo/scripts/dmenu/wd.sh 1
fi

if [ "$func" == "kwdd" ]; then
  bash /home/danilo/scripts/dmenu/wd.sh 2
fi

if [ "$func" == "kwaf" ]; then
  bash /home/danilo/scripts/dmenu/wf.sh 0
fi

if [ "$func" == "kwsf" ]; then
  bash /home/danilo/scripts/dmenu/wd.sh 1
fi

if [ "$func" == "kwdf" ]; then
  bash /home/danilo/scripts/dmenu/wd.sh 2
fi

if [ "$func" == "newtab" ]; then
  bash /home/danilo/scripts/dmenu/newtab.sh
fi

if [ "$func" == "ft1" ]; then
  bash /home/danilo/scripts/dmenu/ft.sh 1 &
fi

if [ "$func" == "ft2" ]; then
  bash /home/danilo/scripts/dmenu/ft.sh 2 &
fi

if [ "$func" == "ft3" ]; then
  bash /home/danilo/scripts/dmenu/ft.sh 3 &
fi

if [ "$func" == "ft4" ]; then
  bash /home/danilo/scripts/dmenu/ft.sh 4 &
fi

if [ "$func" == ".rft1" ]; then
  $(/home/danilo/scripts/goto_saved_window.js s6)
  bash /home/danilo/scripts/dmenu/ft.sh 1 &
fi

if [ "$func" == ".rft2" ]; then
  $(/home/danilo/scripts/goto_saved_window.js s6)
  bash /home/danilo/scripts/dmenu/ft.sh 2 &
fi

if [ "$func" == ".rft3" ]; then
  $(/home/danilo/scripts/goto_saved_window.js s6)
  bash /home/danilo/scripts/dmenu/ft.sh 3 &
fi

if [ "$func" == ".rft4" ]; then
  $(/home/danilo/scripts/goto_saved_window.js s6)
  bash /home/danilo/scripts/dmenu/ft.sh 4 &
fi

if [ "$func" == ".sft1" ]; then
  $(/home/danilo/scripts/goto_saved_window.js s5)
  bash /home/danilo/scripts/dmenu/ft.sh 1 &
fi

if [ "$func" == ".sft2" ]; then
  $(/home/danilo/scripts/goto_saved_window.js s5)
  bash /home/danilo/scripts/dmenu/ft.sh 2 &
fi

if [ "$func" == ".sft3" ]; then
  $(/home/danilo/scripts/goto_saved_window.js s5)
  bash /home/danilo/scripts/dmenu/ft.sh 3 &
fi

if [ "$func" == ".sft4" ]; then
  $(/home/danilo/scripts/goto_saved_window.js s5)
  bash /home/danilo/scripts/dmenu/ft.sh 4 &
fi

if [ "$func" == "kwa" ]; then
  bash /home/danilo/scripts/dmenu/kw.sh 0
fi

if [ "$func" == "kws" ]; then
  bash /home/danilo/scripts/dmenu/kw.sh 1
fi

if [ "$func" == "kwd" ]; then
  bash /home/danilo/scripts/dmenu/kw.sh 2
fi

if [ "$func" == ".slack" ]; then
  /home/danilo/scripts/dmenu/focus_class_name.py k1m4 slack.Slack &
fi

if [ "$func" == ".music" ]; then
  /home/danilo/scripts/dmenu/focus_class_name.py k1m1 rhythmbox.Rhythmbox &
fi

if [ "$func" == ".musicp" ]; then
  rhythmbox-client --play-pause
fi

if [ "$func" == "a" ]; then
  /home/danilo/scripts/dmenu/focus_class_name.py k1m2 google-chrome.Google-chrome &
fi

if [ "$func" == "aa" ]; then
  /home/danilo/scripts/dmenu/focus_class_name.py k1m1 google-chrome.Google-chrome &
fi

if [ "$func" == "aaa" ]; then
  /home/danilo/scripts/dmenu/focus_class_name.py k1m2 google-chrome-beta.Google-chrome-beta &
fi

if [ "$func" == ".clock" ]; then
  /home/danilo/scripts/dmenu/focus_class_name.py k1m1 gnome-clocks.Gnome-clocks
fi

if [ "$func" == ".zapzap" ]; then
  /home/danilo/scripts/dmenu/focus_class_name.py k1m2 google-chrome.Google-chrome
  /home/danilo/scripts/dmenu/send_key.py ctrl1 &
fi

if [ "$func" == ".gmail" ]; then
  /home/danilo/scripts/dmenu/focus_class_name.py k1m2 google-chrome.Google-chrome
  /home/danilo/scripts/dmenu/send_key.py ctrl2 &
fi

if [ "$func" == ".circle" ]; then
  /home/danilo/scripts/dmenu/focus_class_name.py k1m2 google-chrome.Google-chrome
  /home/danilo/scripts/dmenu/send_key.py ctrl3 &
fi

if [ "$func" == ".jira" ]; then
  /home/danilo/scripts/dmenu/focus_class_name.py k1m2 google-chrome.Google-chrome
  /home/danilo/scripts/dmenu/send_key.py ctrl4 &
fi

if [ "$func" == ".heroku" ]; then
  /home/danilo/scripts/dmenu/focus_class_name.py k1m2 google-chrome.Google-chrome
  /home/danilo/scripts/dmenu/send_key.py ctrl5 &
fi

if [ "$func" == ".amazon" ]; then
  /home/danilo/scripts/dmenu/focus_class_name.py k1m2 google-chrome.Google-chrome
  /home/danilo/scripts/dmenu/send_key.py ctrl6 &
fi

if [ "$func" == ".hubspot" ]; then
  /home/danilo/scripts/dmenu/focus_class_name.py k1m1 google-chrome.Google-chrome
  /home/danilo/scripts/dmenu/send_key.py ctrl1 &
fi

if [ "$func" == ".skip" ]; then
  /home/danilo/scripts/dmenu/skip_add.py
fi

if [ "$func" == ".reload" ]; then
  /home/danilo/scripts/dmenu/reload_list_windows.sh
fi

firstChar=$(echo "$func" | awk '{print substr($0,1,1)}')
monitor=$(echo "$func" | awk '{print substr($0,3,1)}')

if [ "$firstChar" == "k" ] && [ "$monitor" == "m" ]; then
  /home/danilo/scripts/dmenu/goto_list_windows.sh "$choice"
fi

if [ "$func" == ".ui1" ]; then
  /home/danilo/scripts/dmenu/focus_class_name.py k2m1 chromium.Chromium
  /home/danilo/scripts/dmenu/send_key.py ctrl2 &
fi

if [ "$func" == ".ui2" ]; then
  /home/danilo/scripts/dmenu/focus_class_name.py k2m1 chromium.Chromium
  /home/danilo/scripts/dmenu/send_key.py ctrl3 &
fi

pkill dzen2

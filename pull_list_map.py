#!/usr/bin/python3

import gi
import os
import sys
import re
import json
import dmenu
import time

gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

sys.path.append("/home/danilo/scripts/")
from wmctrl_window import WmctrlWindow

str_json = open("/home/danilo/scripts/pull_requests.json", "r").read()
pull_requests = json.loads(str_json)
list_to_show = []

for name in pull_requests.keys():
  list_to_show.append(name)

option = dmenu.show(list_to_show, case_insensitive=True, lines=40, bottom=True, monitor=3, font='Monospace-16:normal')
item = pull_requests.get(option, None)

if not item:
  sys.exit()

str_json = open("/home/danilo/scripts/wids.json", "r").read()
jjson = json.loads(str_json)

chrome_window = 'k1m2 google-chrome.Google-chrome 2'
os.popen('/home/danilo/scripts/dmenu/focus_class_name.py {class_window}'.format(class_window=chrome_window)).read()

time.sleep(0.2)

os.popen('google-chrome-stable {pull_url}'.format(pull_url=item['url'])).read()

sys.exit()

#!/usr/bin/python
# -*- coding: utf-8 -*-

import json
import dmenu
import os
import gtk

str_json = open("/home/danilo/scripts/list_copys.json", "r").read()
list_copys = json.loads(str_json)
list_to_show = []
idx = 0

for item in list_copys:
  list_to_show.append("{idx} - {str}".format(idx=idx, str=item.replace("\n", ' ')[:100]))
  idx = idx + 1

option = dmenu.show(list_to_show, case_insensitive=True, lines=20, bottom=True, monitor=3, font='Monospace-16:normal')
option = int(option[:2])

clipboard = gtk.Clipboard()
clipboard.set_text(list_copys[option])
clipboard.store()

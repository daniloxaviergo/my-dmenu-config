#!/usr/bin/python
# -*- coding: utf-8 -*-

import gtk
import json

def test(gtk_clipboard, gdk_event):
  clipboardContents = gtk_clipboard.wait_for_text()

  str_json = open("/home/danilo/scripts/list_copys.json", "r").read()
  list_copys = json.loads(str_json)

  if clipboardContents is not None:
    list_copys.insert(0, clipboardContents)
    list_copys = list_copys[:30]

    wids = open("/home/danilo/scripts/list_copys.json", "w")
    wids.write(json.dumps(list_copys))
    wids.close()

clip = gtk.Clipboard()
clip.connect('owner-change',test)
gtk.main()

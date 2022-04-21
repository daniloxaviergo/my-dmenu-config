#!/usr/bin/python3

import gi
import os
import sys
import re
import json
import time

gi.require_version('Gtk', '3.0')
from gi.repository import Gtk
from gi.repository import Gdk

sys.path.append("/home/danilo/scripts/")
from wmctrl_window import WmctrlWindow

def get_current_window():
  outt = os.popen('/home/danilo/scripts/get_current_window.sh').read()
  current_window_id = outt.replace(',', '').split('x')[1]
  current_window_id = re.sub(r'(\r\n\t|\n|\r\t|\n)', '', current_window_id)

  outt = os.popen('wmctrl -dliGu').read()
  lines = outt.split("\n")
  wmctrl_line = ''

  for line in lines:
    if line.find(current_window_id) >= 0:
      wmctrl_line = line
  return wmctrl_line

class TilixMapping:
  def on_window_destroy(self, *args):
    Gtk.main_quit()

  def on_window_show(self, window1):
    label_window_name = builder.get_object('label_window_name')

    active_window = WmctrlWindow(wmctrl_line)
    # print(repr(active_window))
    label_window_name.set_text(active_window.name)

  def btn_save_clicked(self, btn):
    entry_name = builder.get_object('entry_name')
    entry_session_id = builder.get_object('entry_session_id')
    entry_tab_id = builder.get_object('entry_tab_id')
    entry_init_text = builder.get_object('entry_init_text')

    str_json = open('/home/danilo/scripts/tilix_mapping.json', 'r').read()
    jjson = json.loads(str_json)

    key_json = entry_name.get_text()
    jjson[key_json] = {
      'session': entry_session_id.get_text(),
      'tab': entry_tab_id.get_text(),
      'init_text': entry_init_text.get_text(),
      'window': wmctrl_line,
    }

    wids = open('/home/danilo/scripts/tilix_mapping.json', 'w')
    wids.write(json.dumps(jjson))
    wids.close()

    sys.exit()

  def on_window_key_release_event(self, window, event):
    keycode = event.get_keycode()[1]

    if(keycode == 9):
      sys.exit()

wmctrl_line = get_current_window()
builder = Gtk.Builder()
builder.add_from_file('/home/danilo/scripts/tilix_mapping.glade')
builder.connect_signals(TilixMapping())

window = builder.get_object('window')
window.show_all()

Gtk.main()

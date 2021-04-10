#!/usr/bin/python

import sys
import os
import json

from Xlib import X
from Xlib.display import Display

from wmctrl_window import WmctrlWindow

def main(argv):
  display = Display()
  root = display.screen().root
  root.change_attributes(event_mask=X.PropertyChangeMask | X.SubstructureNotifyMask)

  NET_ACTIVE_WINDOW = display.intern_atom('_NET_ACTIVE_WINDOW')

  try:
    while True:
      event = display.next_event()
      if event.type != X.PropertyNotify:
        continue

      response = root.get_full_property(NET_ACTIVE_WINDOW, X.AnyPropertyType)
      win_id = hex(response.value[0]).rstrip('L').lstrip('0x')

      if len(win_id) == 0:
        continue

      wmctrl_out = os.popen('sleep 0.1; wmctrl -dliGux | grep -i {win_id}'.format(win_id=win_id)).read()
      wmctrl_out = wmctrl_out.split('\n')
      wmctrl_out.pop()

      if len(wmctrl_out) != 1:
        continue

      window = WmctrlWindow(wmctrl_out[0])
      # ignore window switcher
      if window.name == 'tk.TkN/Awindowswitcher':
        continue

      str_json = open("/home/danilo/scripts/flip360_wids.json", "r").read()
      jjson = json.loads(str_json)

      key_json = 'm{m}{w}'.format(m=window.monitor, w=window.workspace)
      window_previous = WmctrlWindow(jjson[key_json])
      if window.id == window_previous.id:
        continue

      jjson[key_json] = window.str_win
      flip360_wids = open("/home/danilo/scripts/flip360_wids.json", "w")
      flip360_wids.write(json.dumps(jjson))
      flip360_wids.close()

  finally:
    display.close()

if __name__ == '__main__':
  sys.exit(main(sys.argv))

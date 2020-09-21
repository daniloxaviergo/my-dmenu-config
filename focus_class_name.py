#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import os
import re

sys.path.append("/home/danilo/scripts/")

from wmctrl_window import WmctrlWindow

outt = os.popen('wmctrl -dliGux').read()
lines = outt.split("\n")
lines.pop()

windows = []
for line in lines:
  windows.append(WmctrlWindow(line))

# if workspace is -1 dont be necessary
workspace = int(sys.argv[1][1]) - 1
monitor = int(sys.argv[1][3])
class_window = sys.argv[2]

windows.sort(key=lambda x: x.monitor, reverse=False)
windows = filter(lambda x: x.monitor == monitor and (workspace == -1 or x.workspace == workspace), windows)
windows = filter(lambda x: re.search("^"+class_window, x.name) , windows)

if len(windows) == 0:
  sys.exit()

move_to_current_workspace = workspace == -1
windows[0].set_focus(move_to_current_workspace)

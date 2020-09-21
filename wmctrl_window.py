# -*- coding: utf-8 -*-

import re
import os

class WmctrlWindow():
  def __init__(self, str_win):
    self.str_win = str_win
    win_attrs    = re.split(r'\s+', self.str_win)
    
    self.id         = win_attrs[0]
    self.name       = re.sub(r'^(xavier|N\/A)', '', ''.join(win_attrs[6:]))
    self.workspace  = int(win_attrs[1])
    self.left       = int(win_attrs[2])
    self.top        = int(win_attrs[3])
    self.width      = int(win_attrs[4])
    self.height     = int(win_attrs[5])
    self.monitor    = 0

    self.monitor1 = { 'x': 3840,  'y': 400 }
    self.monitor2 = { 'x': 7680,  'y': 400 }
    self.monitor3 = { 'x': 10560, 'y': 1349 }
    self.monitor4 = { 'x': 10560, 'y': -1 }

    # 
    if self.left < self.monitor3['x'] and self.top > self.monitor3['y']:
      self.monitor = 3
    elif self.left < self.monitor1['x'] and self.top > self.monitor1['y']:
      self.monitor = 1
    elif self.left < self.monitor2['x'] and self.top > self.monitor2['y']:
      self.monitor = 2
    elif  self.left < self.monitor4['x'] and self.top > self.monitor4['y']:
      self.monitor = 4

    self.valid = self.id and self.workspace >= 0 and self.left >= 0

  def set_focus(self, move_win = False):
    # move window to current workspace
    if move_win:
      current_workspace = os.popen("wmctrl -d | grep '*' | cut -d ' ' -f1").read()
      current_workspace = re.sub(r'(\r\n\t|\n|\r\t|\n)', '', current_workspace)

      if current_workspace != str(self.workspace):
        os.popen('wmctrl -r -R -i -a {win_id} -t {work}'.format(win_id=self.id, work=current_workspace)).read()

    os.popen('wmctrl -i -a {win_id}'.format(win_id=self.id)).read()

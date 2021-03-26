# -*- coding: utf-8 -*-

import re
import os
import json

class SublimeTab():
  def __init__(self, window_id, path_file, idx):
    self.id         = idx
    self.type       = 'sublime'
    self.title      = path_file
    self.window_id  = window_id

  def set_focus(self):
    # subl --command "set_tabs_file {\"window_id\": \"5\", \"idx\": \"0\"}"
    print('set_focus_sublime')
    args = { 'window_id': str(self.window_id), 'idx': str(self.id) }
    args = json.dumps(args).replace('"', '\\"')
    print('subl --background --command "set_tabs_file {args}"'.format(args=args))

    os.popen('wmctrl -i -a {win_id}'.format(win_id=self.window_id)).read()
    os.popen('subl --background --command "set_tabs_file {args}"'.format(args=args)).read()

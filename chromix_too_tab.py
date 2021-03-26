# -*- coding: utf-8 -*-

import re
import os

class ChromixTooTab():
  def __init__(self, str_tab):
    self.str_tab = str_tab
    tab_attrs    = re.split(r'\s+', self.str_tab)

    self.id         = tab_attrs[0]
    self.domain     = re.findall(r'^(?:https?:)?(?:\/\/)?(?:[^@\n]+@)?(?:www\.)?([^:\/\n]+)', tab_attrs[1])
    self.domain     = ''.join(self.domain)
    self.title      = ' '.join(tab_attrs[2:])
    self.type       = 'chromix-too'

  def set_focus(self):
    os.popen('wmctrl -s 0').read()
    os.popen('chromix-too focus {tab_id}'.format(tab_id=self.id)).read()

#!/usr/bin/env python
# -*- coding: utf-8 -*-

import dbus
import os
import sys
import urlparse
import urllib
import json
import dmenu
import os
import gtk

# ls -ld $PWD/* | awk '{print $9}'

bus = dbus.SessionBus()
obj = bus.get_object('org.xfce.Thunar', '/org/xfce/FileManager')
iface = dbus.Interface(obj, 'org.xfce.FileManager')

_thunar_display_folder = iface.get_dbus_method('DisplayFolder')
_thunar_display_folder_and_select = iface.get_dbus_method('DisplayFolderAndSelect')

def display_folder(uri, display='', startup_id=''):
  _thunar_display_folder(uri, display, startup_id)

def display_folder_and_select(uri, filename, display='', startup_id=''):
  _thunar_display_folder_and_select(uri, filename, display, startup_id)

def path_to_url(path):
  return urlparse.urljoin('file:', urllib.pathname2url(path))

def url_to_path(url):
  return urlparse.urlparse(url).path

def thunar_open_file(path):
  path = url_to_path(path)
  path = os.path.realpath(path)
  url = path_to_url(path)

  if os.path.isfile(path):
    dirname = os.path.dirname(url)
    filename = os.path.basename(url)
    display_folder_and_select(dirname, filename)
  else:
    display_folder(url)

str_json = open("/home/danilo/scripts/list_favority_files.json", "r").read()
favority_files = json.loads(str_json)
list_to_show = []
idx = 0

for item in favority_files:
  list_to_show.append("{idx}  - {str}".format(idx=idx, str=item.replace("\n", ' ')[:300]))
  idx = idx + 1

option = dmenu.show(list_to_show, case_insensitive=True, lines=20, bottom=True, monitor=3, font='Monospace-16:normal')
idx = int(option[:3])
thunar_open_file(favority_files[idx])

#!/usr/bin/env python
# -*- coding: utf-8 -*-

import dbus
import os
import sys
import dmenu
import re

bus = dbus.SessionBus()
def get_track_rhythmbox3(bus):
  try:
    obj = bus.get_object('org.gnome.Rhythmbox3', '/org/mpris/MediaPlayer2')
    iface2 = dbus.Interface(obj, 'org.freedesktop.DBus.Properties')

    metadata = iface2.Get('org.mpris.MediaPlayer2.Player', 'Metadata')
    artist = metadata.get(dbus.String(u'xesam:artist'))[0]
    album = metadata.get(dbus.String(u'xesam:album'))
    title = metadata.get(dbus.String(u'xesam:title'))
    return album + ' ' + artist + ' ' + title
  except dbus.exceptions.DBusException:
    return 'Não iniciado'

def get_track_smplayer(bus):
  try:
    obj = bus.get_object('org.mpris.MediaPlayer2.smplayer', '/org/mpris/MediaPlayer2')
    iface2 = dbus.Interface(obj, 'org.freedesktop.DBus.Properties')

    metadata = iface2.Get('org.mpris.MediaPlayer2.Player', 'Metadata')
    return metadata['xesam:title'].encode('utf-8')
  except dbus.exceptions.DBusException:
    return 'Não iniciado'

def get_track_vlc(bus):
  try:
    obj = bus.get_object('org.mpris.MediaPlayer2.vlc', '/org/mpris/MediaPlayer2')
    iface2 = dbus.Interface(obj, 'org.freedesktop.DBus.Properties')

    metadata = iface2.Get('org.mpris.MediaPlayer2.Player', 'Metadata')
    return metadata['xesam:url'].encode('utf-8')
  except dbus.exceptions.DBusException:
    return 'Não iniciado'

def get_track_libet(bus):
  try:
    obj = bus.get_object('net.sacredchao.QuodLibet', '/net/sacredchao/QuodLibet')
    iface = dbus.Interface(obj, 'net.sacredchao.QuodLibet')

    current_song = iface.get_dbus_method('CurrentSong')
    metadata = current_song()

    return re.sub(metadata['~mountpoint'] + '/', '', metadata['~filename']).encode('utf-8')
  except dbus.exceptions.DBusException:
    return 'Não iniciado'

def playpause_rhythmbox3(bus):
  try:
    obj = bus.get_object('org.gnome.Rhythmbox3', '/org/mpris/MediaPlayer2')
    iface = dbus.Interface(obj, 'org.mpris.MediaPlayer2.Player')
    player_playpause = iface.get_dbus_method('PlayPause')
    player_playpause()
  except dbus.exceptions.DBusException:
    return

def playpause_smplayer(bus):
  try:
    obj = bus.get_object('org.mpris.MediaPlayer2.smplayer', '/org/mpris/MediaPlayer2')
    iface = dbus.Interface(obj, 'org.mpris.MediaPlayer2.Player')
    player_playpause = iface.get_dbus_method('PlayPause')
    player_playpause()
  except dbus.exceptions.DBusException:
    return

def playpause_vlc(bus):
  try:
    obj = bus.get_object('org.mpris.MediaPlayer2.vlc', '/org/mpris/MediaPlayer2')
    iface = dbus.Interface(obj, 'org.mpris.MediaPlayer2.Player')
    player_playpause = iface.get_dbus_method('PlayPause')
    player_playpause()
  except dbus.exceptions.DBusException:
    return

def playpause_libet(bus):
  try:
    obj = bus.get_object('net.sacredchao.QuodLibet', '/net/sacredchao/QuodLibet')
    iface = dbus.Interface(obj, 'net.sacredchao.QuodLibet')
    player_playpause = iface.get_dbus_method('PlayPause')
    player_playpause()
  except dbus.exceptions.DBusException:
    return

list_to_show = [
  'Rhythmbox3 || ' + get_track_rhythmbox3(bus),
  'SMPlayer || ' + get_track_smplayer(bus),
  'QuodLibet || ' + get_track_libet(bus),
  'Vlc || ' + get_track_vlc(bus)
]

option = dmenu.show(list_to_show, case_insensitive=True, lines=20, bottom=True, monitor=3, font='Monospace-16:normal')
if option == None:
  sys.exit()

option = option.split(' ||')[0].lower()

if option == 'rhythmbox3':
  playpause_rhythmbox3(bus)
elif option == 'smplayer':
  playpause_smplayer(bus)
elif option == 'vlc':
  playpause_vlc(bus)
elif option == 'quodlibet':
  playpause_libet(bus)

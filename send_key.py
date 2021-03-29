#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import os
# import re

# import pyautogui

key = sys.argv[1]

if key == 'ctrl1':
  # pyautogui.hotkey('ctrl', '1')
  os.popen('xdotool key ctrl+1').read()
  sys.exit()

if key == 'ctrl2':
  # pyautogui.hotkey('ctrl', '2')
  os.popen('xdotool key ctrl+2').read()
  sys.exit()

if key == 'ctrl3':
  # pyautogui.hotkey('ctrl', '3')
  os.popen('xdotool key ctrl+3').read()
  sys.exit()

if key == 'ctrl4':
  # pyautogui.hotkey('ctrl', '4')
  os.popen('xdotool key ctrl+4').read()
  sys.exit()

if key == 'ctrl5':
  # pyautogui.hotkey('ctrl', '5')
  os.popen('xdotool key ctrl+5').read()
  sys.exit()

if key == 'ctrl6':
  # pyautogui.hotkey('ctrl', '6')
  os.popen('xdotool key ctrl+6').read()
  sys.exit()

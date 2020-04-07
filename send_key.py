#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import os
import re

import pyautogui

key = sys.argv[1]

if key == 'ctrl1':
  pyautogui.hotkey('ctrl', '1')
  sys.exit()

if key == 'ctrl2':
  pyautogui.hotkey('ctrl', '2')
  sys.exit()

if key == 'ctrl3':
  pyautogui.hotkey('ctrl', '3')
  sys.exit()

if key == 'ctrl4':
  pyautogui.hotkey('ctrl', '4')
  sys.exit()

if key == 'ctrl5':
  pyautogui.hotkey('ctrl', '5')
  sys.exit()

if key == 'ctrl6':
  pyautogui.hotkey('ctrl', '6')
  sys.exit()

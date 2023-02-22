#!/usr/bin/xonsh

import sys
import os
import json

import time
from datetime import datetime

def main(argv):
  my_ip = argv[1]

  try:
    while True:
      my_current_ip = $(curl ifconfig.me)

      if my_ip != my_current_ip:
        print(my_current_ip)
        notify-send "\nIP diferente\n" "\n Atualizar account \n <a href=\"https://www.binance.com/pt-BR/my/settings/api-management/\">Account Management</a>\n ." --urgency=critical --icon=/usr/share/icons/Adwaita/256x256/status/software-update-urgent.png      

      print(datetime.now())
      time.sleep(600) # Sleep for 600 seconds (10 minutes)
  finally:
    print('finally')

if __name__ == '__main__':
  sys.exit(main(sys.argv))

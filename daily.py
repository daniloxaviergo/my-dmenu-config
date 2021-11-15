#!/usr/bin/env xonsh
# PYTHON_ARGCOMPLETE_OK

import gi
import os
import sys
import re
import json
import random

from datetime import datetime

books_of_day = []
# random.choice($(cat /tmp/wtcommands | grep leituras).split("\n"))
all_books = list(filter(len, $(docker container exec ruby /usr/src/app/leituras.rb list | awk '{for(i=2;i<=NF;i++) printf $i" "; print ""}').split("\n")))

date_time = datetime.now().strftime("%d-%m-%Y")
print(date_time)
print()

def random_book_choice():
  book = random.choice(all_books)

  max_attempt = 5
  while max_attempt > 0:
    if not book in books_of_day:
      books_of_day.append(book)
      max_attempt = 0

    max_attempt = max_attempt - 1

  return book

str_json = open('/home/danilo/daily.json', 'r').read()
dailies = json.loads(str_json)

for hour, activites in dailies.items():
  if hour == 'version':
    continue

  activity = random.choice(activites)

  if activity == 'reading':
    activity = random_book_choice()

  print(hour, activity)

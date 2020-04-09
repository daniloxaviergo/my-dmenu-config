#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import json

ffile = sys.argv[1]
jkey = sys.argv[2:]

str_json = open(ffile, "r").read()
jjson = json.loads(str_json)

value = jjson
for json_key in jkey:
  value = value[json_key]

print(value)

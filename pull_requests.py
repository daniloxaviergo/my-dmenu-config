#!/usr/bin/python3

import os
import sys
import json
from github import Github

g = Github(os.environ['GITHUB_TOKEN'])
pull_requests = {}

repositories = ['project1', 'project2', 'project3']
for repository in repositories:
  repo = g.get_repo('repo/{repository}'.format(repository=repository))
  pulls = repo.get_pulls(state='open', sort='updated')
  for pr in pulls:
    key = '{user_login} {user_name} | {repository} | {title}'.format(user_login=pr.user.login,
                                                                     user_name=pr.user.name,
                                                                     repository=repository,
                                                                     title=pr.title)
    url = 'https://github.com/repo/{repository}/pull/{number}/files'.format(repository=repository, number=pr.number)
    pull_requests[key] = { 'url': url }

fpull = open('/home/danilo/scripts/pull_requests.json', 'w')
fpull.write(json.dumps(pull_requests))
fpull.close()

sys.exit()

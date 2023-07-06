#!/usr/bin/env bash
#export db_host=127.0.0.1
#export db_port=6379
#export db_type=redis
#export db_password=''
#
#
#tmux split-window -e -h ~/.pyenv/versions/3.7.7/bin/python proxyPool.py webserver
#~/.pyenv/versions/3.7.7/bin/python proxyPool.py schedule
python proxyPool.py webserver &
python proxyPool.py schedule
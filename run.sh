#!/bin/sh
. ./env.sh
chmod +x ./b0t/bin/hubot
cd ./b0t && ./bin/hubot -a irc --name b0t

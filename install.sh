#!/bin/bash
if [ $UID -eq 0 ]; then
    echo "Do not run as root" >&2
    exit -1
fi
npm i
export PATH=`pwd`/node_modules/.bin:$PATH
. ./env.sh
rm -rf b0t
./node_modules/.bin/hubot --create b0t
rm -f b0t/node_modules
ln -s `pwd`/node_modules b0t/node_modules

# clean all the default scripts, use our own scripts.
cp ./hubot-scripts.json ./b0t/hubot-scripts.json
rm b0t/scripts/*
cp ./scripts/* b0t/scripts/

# TODO livescript support

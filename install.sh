#!/bin/sh
npm i
export PATH=`pwd`/node_modules/.bin:$PATH
. ./env.sh
./node_modules/.bin/hubot --create b0t
rm -f b0t/node_modules
ln -s `pwd`/node_modules b0t/node_modules

# clean all the default scripts
rm ./b0t/scripts/*
echo '[]' > ./b0t/hubot-scripts.json

# TODO install livescript support

# TODO install useful hubot-scripts

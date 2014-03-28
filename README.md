## What/Why is this project?
 * Please read [g0v irc robot by hubot](https://g0v.hackpad.com/g0v-irc-robot-by-hubot-IBmzHC20wBb)

## Pre-requirement

 * redis-server (redis is required for permanent storage, if your bot doesn't need a permanent memory, remove `redis-brain.coffee` from `hubot-scripts.json`)

## Install & run

 1. Change settings on `env.sh`, choose a nickname.

 2. `./install.sh`

 3. `./run.sh` (this will run a bot on irc by the hubot-irc adaptor. Before going online, please test your bot with `./b0t/bin/hubot` first. Try not to flood the channel.)


## What's next?

 * Write hubot scripts: https://github.com/github/hubot/blob/master/docs/scripting.md

 * List of available hubot scripts: http://hubot-script-catalog.herokuapp.com/


`robot.hear` is dangerous (use `robot.respond` instead), we may cause a infinite bot-to-bot chatting. There seems no OP to stop the robots :p.

## License

 * scripts/ping.coffee
 * scripts/github-issue-link.coffee
 * scripts/tasks.coffee

```
Copyright (c) 2014 GitHub Inc.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

 * all others

   Copyright © 2014 g0v Contributors - http://g0v.mit-license.org/

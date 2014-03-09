# Description:
#   Fork me
#
# Dependencies:
#   This is a sample hubot script
#
# Configuration:
#   None
#
# Commands:
#   hey
#
# Author:
#   g0v contributors

module.exports = (robot) ->
  robot.respond /hey/i, (msg) ->
    msg.reply "Fork me on https://github.com/g0v/b0t-hubot"

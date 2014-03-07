# Description:
#   Fork me
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author:
#   youchenlee

module.exports = (robot) ->
  robot.respond /.*/, (msg) ->
    msg.reply "Fork me on https://github.com/youchenlee/b0t-hubot ;p"

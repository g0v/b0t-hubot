# Description
#   Answer the 'what is' questions and the answer is gotten from Get g0v-communique's entries. 
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot what is <entry> - Asking the question about the entry.
#
# Author:
#   g0v contributors (2014)
#   Lee

module.exports = (robot) ->
    robot.hear /what is (.*)$/i, msg, ->
        msg.send "#{msg.match[2]}"
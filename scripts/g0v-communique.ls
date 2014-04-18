# Description
#   Answer the 'what is' questions and the answer is gotten from Communique-API.
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
    robot.handle-response = (msg, is-public) ->
        robot.http "http://g0v-communique-api.herokuapp.com/api/1.0/tags/#{msg.match[1]}"
            .get! (err, res, body) ->
                resp-string = "I have an error!!!!"
                if !err
                    if body != '{}'
                        entryJSON = JSON.parse body
                        entryContent = entryJSON.description
                        for url in entryJSON.urls
                            entryContent = entryContent.replace url.name, "#{url.name}( #{url.url} )"
                        resp-string = "About #{entryJSON.name}: #{entryContent}"
                    else
                        resp-string = "Sorry. This entry is empty. Welcome to add the entry in https://g0v.hackpad.com/Fe3VpeN42w9"
                if is-public
                    msg.send resp-string
                else
                    msg.reply "ok!"
                    msg.send-private resp-string

    robot.hear /what is (.+?)$/i, (msg) ->
        robot.handle-response msg, true

    robot.hear /pm me (.+?)$/i, (msg) ->
        robot.handle-response msg, false


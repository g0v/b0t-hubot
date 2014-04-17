// Description
//   Answer the 'what is' questions and the answer is gotten from Communique-API.
//
// Dependencies:
//   None
//
// Configuration:
//   None
//
// Commands:
//   hubot what is <entry> - Asking the question about the entry.
//
// Author:
//   g0v contributors (2014)
//   Lee

module.exports = function (robot) {
    robot.hear(/what is (.+?)$/i, function (msg) {
        robot.http("http://g0v-communique-api.herokuapp.com/api/1.0/tags/" + msg.match[1]).get()(function (err, res, body) {
            if (err) {
                msg.send("I have an error!!!!")
            } else {
                if (body != '{}') {
                    var entryJSON = JSON.parse(body);
                    var entryContent = entryJSON["description"];
                    for (var i = 0; i < entryJSON.urls.length; i++) {
                        entryContent = entryContent.replace(entryJSON.urls[i].name, entryJSON.urls[i].name + '( ' + entryJSON.urls[i].url + ' )');
                    }
                    msg.send("About " + entryJSON["name"] + ": " + entryContent);
                } else {
                    msg.send("Sorry. This entry is empty. Welcome to add the entry in https://g0v.hackpad.com/Fe3VpeN42w9");
                }
            }
        });
    });
}
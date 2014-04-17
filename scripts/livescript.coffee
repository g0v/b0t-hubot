# Description:
#   Loads scripts written in LiveScript.

require 'LiveScript'

Fs   = require 'fs'
Path = require 'path'

module.exports = (robot) ->
  for file in Fs.readdirSync(__dirname)
    ext = Path.extname file
    if ext is '.ls'
      try
        path = Path.join __dirname, file
        require(path) robot
        robot.parseHelp path
      catch error
        robot.logger.error "Unable to load #{file}: #{error.stack}"
        process.exit(1)

#   Allows tasks (TODOs) to be added to Hubot
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot task add <task> - Add a task
#   hubot task list tasks - List the tasks
#   hubot task delete <task number> - Delete a task
#
# Author:
#   g0v contributors (2014)
#   Crofty

class Tasks
  constructor: (@robot) ->
    @cache = []
    @robot.brain.on 'loaded', =>
      if @robot.brain.data.tasks
        @cache = @robot.brain.data.tasks
  nextTaskNum: ->
    maxTaskNum = if @cache.length then Math.max.apply(Math,@cache.map (n) -> n.num) else 0
    maxTaskNum++
    maxTaskNum
  add: (taskString) ->
    task = {num: @nextTaskNum(), task: taskString}
    @cache.push task
    @robot.brain.data.tasks = @cache
    task
  all: -> @cache
  deleteByNumber: (num) ->
    index = @cache.map((n) -> n.num).indexOf(parseInt(num))
    task = @cache.splice(index, 1)[0]
    @robot.brain.data.tasks = @cache
    task

module.exports = (robot) ->
  tasks = new Tasks robot

  robot.respond /(task add|add task) (.+?)$/i, (msg) ->
    d = new Date()
    task = tasks.add "#{d.toTimeString()} #{msg.message.user.name}: #{msg.match[2]}"
    msg.send "Task added: ##{task.num}"

  robot.respond /(help)/i, (msg) ->
    msg.send "task add <task> | task done <task number> | http://task.g0v.today/ # task list"

  robot.respond /(task delete|delete task|task done|done task) #?(\d+)/i, (msg) ->
    taskNum = msg.match[2]
    task = tasks.deleteByNumber taskNum
    msg.send "Task done: ##{task.num} - #{task.task}"

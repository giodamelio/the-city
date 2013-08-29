child_process = require "child_process"
fs = require "fs"

async = require "async"

# Spawn function
spawn = (cmd, options, callback) ->
    p = child_process.spawn cmd, options.split " "
    p.stdout.on "data", (data) ->
        process.stdout.write data.toString()
    p.on "exit", ->
        callback?()
    p.on "error", (err) ->
        console.log err

console.log "Generating images"

if process.argv.length > 2
    radius = parseInt(process.argv[2])
    width = radius * 2
    total = (width + 1) * (width + 1)
else
    console.log "Missing parameters"
    process.exit 1

console.log "Square with a width and height of #{width}"

progress = 0

# The image worker
worker = (task, callback) ->
    command = "-size 256x256 -background #FF4040 -fill #4671D5 -gravity center -pointsize 20 label:#{task.x},#{task.y} 1/#{task.x}_#{task.y}.png"
    if not fs.existsSync("1/#{task.x}_#{task.y}.png")
        spawn "convert", command, ->
            console.log "Generated ##{task.progress}/#{task.total}: #{task.x}, #{task.y}"
            callback()
    else
        console.log " File 1/#{task.x}_#{task.y}.png exists, skipping"
        callback()

# Make a queue
q = async.queue worker, 2

# Exit message
q.drain = ->
    console.log "All done"

for x in [-radius..radius]
    for y in [-radius..radius]
        progress = progress + 1
        task = 
            x: x
            y: y
            progress: progress
            total: total
        q.push task, (err) ->
            if err then console.log err

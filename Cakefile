child_process = require "child_process"

takeapeek = require "takeapeek"

path = 
    browserify: "node_modules/.bin/browserify"
    nodemon: "node_modules/.bin/nodemon"

spawn = (cmd, options, callback) ->
    p = child_process.spawn cmd, options.split " "
    p.stdout.on "data", (data) ->
        process.stdout.write data.toString()
    p.on "exit", ->
        callback?()

task "all", "serve the files and watch the coffeescript", ->
    invoke "browserify:watch"
    invoke "server"

task "browserify:compile", "Compile the coffeescript", ->
    spawn path.browserify, "-t coffeeify -e app/src/main.coffee -o app/lib/bundle.js"

task "browserify:watch", "Compile and watch the coffeescript", ->
    spawn path.nodemon, "-w app/ -x browserify --transform coffeeify --entry app/src/main.coffee --outfile app/lib/bundle.js"

task "server", "serve the static files", ->
    tap = new takeapeek
        directory: "app"
        index: true
        dotfiles: true
        port: 3141
        verbose: true
    tap.listen()

path = require 'path'
koa = require 'koa'
app = do koa
serve = require 'koa-static'

root = path.join __dirname, 'public'
opts = {}
console.log root

app.use serve "#{root}/js", {}
app.use serve "#{root}/css", {}
app.use serve root, {index: 'app.html'}

app.listen 3000

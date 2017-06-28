path = require 'path'
Koa = require 'koa'
app = new Koa()
serve = require 'koa-static'

root = path.join __dirname, 'public'
opts = {}
console.log root

app.use serve "#{root}/js", {}
app.use serve "#{root}/css", {}
app.use serve root, {index: 'app.html'}

app.listen 3000

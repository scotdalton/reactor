autoprefixer = require 'autoprefixer'
coffee = require 'gulp-coffee'
g = require 'gulp'
buffer = require 'vinyl-buffer'
browserify = require 'browserify'
nano = require 'gulp-cssnano'
path = require 'path'
postcss = require 'gulp-postcss'
reactify = require 'coffee-reactify'
sass = require 'gulp-sass'
source = require 'vinyl-source-stream'
sourcemaps = require 'gulp-sourcemaps'
uglify = require 'gulp-uglify'
util = require 'gulp-util'

src = "#{__dirname}/src"
dependencies = "#{__dirname}/node_modules"

g.task 'koa',  ->
  g.src "#{__dirname}/koa.coffee"
  .pipe coffee bare: true
  .pipe g.dest __dirname
  .on 'error', util.log

g.task 'js', ->
  browserify
    paths: [src, dependencies]
    extensions: ['.coffee', '.cjsx']
    debug: true
  .transform reactify, global: true
  .add "#{src}/app/app"
  .bundle()
  .on 'error', util.log
  .pipe source 'app.js'
  .pipe buffer()
  .pipe sourcemaps.init loadMaps: true
  .pipe uglify()
  .pipe sourcemaps.write './'
  .pipe g.dest './public/js'

g.task 'css', ->
  g.src "#{src}/app/app.sass"
  .pipe do sourcemaps.init
  .pipe sass
    includePaths: src
    outputStyle: 'compressed'
  .on 'error', util.log
  .pipe postcss [autoprefixer browsers: ['last 3 versions']]
  .pipe do nano
  .pipe do sourcemaps.write
  .pipe g.dest './public/css'

g.task 'html', ->
  g.src './src/app/app.html'
  .pipe g.dest './public'

g.task 'default', ['koa', 'css', 'html', 'js']

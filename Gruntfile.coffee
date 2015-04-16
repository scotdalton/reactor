module.exports = (grunt) ->
  npmTasks = [
    'grunt-shell',
    'grunt-contrib-clean',
    'grunt-contrib-uglify',
    'grunt-browserify',
    'grunt-contrib-sass'
  ]
  grunt.loadNpmTasks npmTask for npmTask in npmTasks

  grunt.initConfig
    clean: ["public/js", "public/css"]
    sass:
      options:
        style: 'compressed'
        bundleExec: true
      target:
        files:
          'public/css/application.css': 'app/assets/application.sass'
    uglify:
      min:
        files:
          'public/js/application.min.js': 'public/js/application.js'
    browserify:
      options:
        transform: ['coffee-reactify']
      target:
        files:
          'public/js/application.js': 'app/assets/**/*.cjsx'

  defaults = [
    'clean',
    'browserify',
    'uglify',
    'sass'
  ]
  grunt.registerTask('default', defaults)

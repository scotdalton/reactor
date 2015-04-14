module.exports = (grunt) ->
  npmTasks = [
    'grunt-shell',
    'grunt-contrib-uglify',
    'grunt-contrib-clean',
    'grunt-contrib-sass'
  ]
  grunt.loadNpmTasks npmTask for npmTask in npmTasks

  grunt.initConfig
    clean: ["tmp/js", "public/js", "public/css"]
    sass:
      options:
        style: 'compressed'
        bundleExec: true
      target:
        files:
          'public/css/application.css': 'app/assets/application.sass'
    uglify:
      options:
        mangle: false
        beautify: true
      target:
        files:
          'public/js/application.min.js': [
            'tmp/js/bFile/bFile.js',
            'tmp/js/bFileList/bFileList.js',
            'tmp/js/bPrompt/bPrompt.js',
            'tmp/js/bIntro/bIntro.js',
            'tmp/js/bStdIn/bStdIn.js',
            'tmp/js/bStdOut/bStdOut.js',
            'tmp/js/bCommand/bCommand.js',
            'tmp/js/bShell/bShell.js',
            'tmp/js/application.js'
          ]
    shell:
      options:
        stderr: false
      react:
        command: 'cjsx -bcm -o tmp/js app/assets'

  grunt.registerTask('default', ['clean', 'shell:react', 'uglify', 'sass'])

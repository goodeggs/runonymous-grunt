module.exports = (grunt) ->
  require('./')(grunt)
  require('should')
  grunt.loadNpmTasks('grunt-contrib-jshint')

  grunt.initConfig
    jshint:
      all: 'runonymous.js'
      options:
          curly: true
          eqeqeq: true
          immed: true
          latedef: true
          newcap: true
          noarg: true
          sub: true
          undef: true
          boss: true
          eqnull: true
          node: true

  beeped = false
  grunt.registerTask 'beep', ->
    beeped = true

  grunt.registerTask 'test', [
    'jshint:all'
    'beep'
    -> beeped.should.be.true
  ]

  grunt.registerTask 'default', ['test']

# runonymous-grunt
[![Build Status](https://travis-ci.org/goodeggs/runonymous-grunt.png)](https://travis-ci.org/goodeggs/runonymous-grunt)

Queue an anonymous function with `grunt.task.run`.  Often used to log or cleanup after delegating some work to another task via `grunt.task.run('some:other:task')`.

```js
grunt.registerTask('foo', function() {
  grunt.task.run(
    'beep',
    'boop',
    function() {            // Check out this anonymous function!
      grunt.log.ok('done'); // 'done' will be logged after the 'boop' task finishes
    }
});
```

## Getting Started
Grunt `~0.4.1`

You should be comfy with the [grunt basics](http://gruntjs.com/getting-started) and [npm](https://npmjs.org/doc/README.html) so you can install this in your project

```shell
> npm install runonymous-grunt --save-dev
```

Here's an example where some extra logging helps us distinguish between
similar targets

```js
require('runonymous-grunt')(grunt);
grunt.loadNpmTasks('grunt-contrib-jasmine');

grunt.registerTask('spec:shared', function() {
  grunt.task.run(
    function() {
      grunt.log.writeln('Testing shared code in the browser');
    },
    'jasmine:client',

    function() {
      grunt.log.writeln('Testing shared code on the server');
    },
    'jasmine:server',
});
```

It's even cleaner in coffeescript:

```coffee
require('runonymous-grunt')(grunt)
grunt.loadNpmTasks('grunt-contrib-jasmine')

grunt.registerTask 'spec:shared, ->
  grunt.task.run(
    -> grunt.log.writeln('Testing shared code in the browser')
    'jasmine:client'

    -> grunt.log.writeln('Testing shared code on the server')
    'jasmine:server'
  )
```

/*
 * runonymous-grunt
 *
 * Licensed under the MIT license.
 */

'use strict';

module.exports = function(grunt) {
  var _ = require('lodash'),
      run = grunt.task.run;

  grunt.task.run = function() {
    var self = this;
    _(arguments).flatten().forEach(function(task) {
      if(typeof task === 'function') {
        self._push({task: {fn: task}});
      } else {
        run.call(self, task);
      }
    });
  };
};

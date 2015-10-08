"use strict";

module.exports = function(grunt) {
  require("time-grunt")(grunt);
  require('load-grunt-tasks')(grunt, {
    pattern: [
      'grunt-*',
      '!grunt-configure',
      'assemble*',
      '!assemble-contrib*',
      '!assemble-middleware*'
    ]
  });

  grunt.initConfig(
    require("grunt-configure")("./config/*.{js,json,yml}")
  );

  grunt.registerTask("build", [
    "exec", "assemble", "less", "copy"
  ]);

  grunt.registerTask("dev",     [ "build", "connect:livereload", "watch" ]);
  grunt.registerTask("deploy",  [ "build", "s3" ]);
  grunt.registerTask("default", [ "build" ]);
};

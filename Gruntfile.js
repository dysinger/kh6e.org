"use strict";

module.exports = function(grunt) {
  require("time-grunt")(grunt);

  grunt.initConfig(
    require("grunt-configure")("./config/*.{js,json,yml}")
  );

  grunt.loadNpmTasks("assemble");
  grunt.loadNpmTasks("assemble-less");
  grunt.loadNpmTasks("grunt-contrib-clean");
  grunt.loadNpmTasks("grunt-contrib-connect");
  grunt.loadNpmTasks("grunt-contrib-copy");
  grunt.loadNpmTasks("grunt-contrib-watch");
  grunt.loadNpmTasks("grunt-execute");
  grunt.loadNpmTasks("grunt-frep");
  grunt.loadNpmTasks("grunt-purescript");
  grunt.loadNpmTasks("grunt-sync-pkg");
  grunt.loadNpmTasks("grunt-s3");
  grunt.loadNpmTasks("grunt-verb");

  grunt.registerTask("build", [
    "psc:lib",
    "dotPsci",
    "assemble",
    "less",
    "copy:bower",
    "copy:site"
  ]);

  grunt.registerTask("test", [ "psc:tests", "execute:tests" ]);
  grunt.registerTask("dev", [ "build", "connect:livereload", "watch" ]);
  grunt.registerTask("deploy", [ "build", "s3" ]);
  grunt.registerTask("default", [ "build" ]);
};

"use strict";

module.exports = function(grunt) {
  require("time-grunt")(grunt);

  grunt.initConfig({

    // purescript //
    libFiles: [
      "src/**/*.purs",
      "bower_components/purescript-*/src/**/*.purs"
    ],
    pscMake: {
      lib: {
        src: ["<%= libFiles %>"]
      },
      tests: {
        src: ["tests/Tests.purs", "<%= libFiles %>"]
      }
    },
    dotPsci: ["<%= libFiles %>"],
    execute: {
      tests: {
        src: "tmp/index.js"
      }
    },

    // copy //
    copy: {
      ps: {
        cwd: "output",
        src: ["**"],
        dest: "tmp/node_modules/",
        expand: true
      },
      bower: {
        files: [
          { cwd: "bower_components/L.GeoSearch/src/",
            src: ["**"],
            dest: "dist/assets/L.GeoSearch/",
            expand: true },
          { cwd: "bower_components/Leaflet.awesome-markers/dist/",
            src: ["**"],
            dest: "dist/assets/Leaflet.awesome-markers/",
            expand: true },
          { cwd: "bower_components/bootstrap/dist/",
            src: ["**"],
            dest: "dist/assets/bootstrap/",
            expand: true },
          { cwd: "bower_components/classie/",
            src: ["*.js"],
            dest: "dist/assets/classie/",
            expand: true },
          { cwd: "bower_components/font-awesome/",
            src: ["**/*.{css,eot,js,map,svg,ttf,woff}"],
            dest: "dist/assets/font-awesome/",
            expand: true },
          { cwd: "bower_components/html5shiv/dist/",
            src: ["**"],
            dest: "dist/assets/html5shiv/",
            expand: true },
          { cwd: "bower_components/jquery/dist/",
            src: ["**"],
            dest: "dist/assets/jquery/",
            expand: true },
          { cwd: "bower_components/leaflet/dist/",
            src: ["**"],
            dest: "dist/assets/leaflet/",
            expand: true }
        ]
      },
      site: {
        src: ["js/**", "img/**"],
        dest: "dist/assets/",
        expand: true
      },
    },

    // assemble //
    assemble: {
      options: {
        assets: "assets",
        data: "data/{,*/}*.{json,yml}",
        layoutdir: "layouts",
        layout: "default.hbs",
        partials: "partials/{,*/}*.hbs",
        plugins: [
          "assemble-contrib-permalinks",
          "assemble-contrib-sitemap"
        ],
        flatten: true
      },
      site: {
        files: {"dist/": "pages/{,*/}*.hbs"}
      }
    },
    // assemble-less //
    less: {
      styles: {
        files: {
          "dist/assets/css/default.css": [ "less/default.less" ],
          "dist/assets/css/index.css":   [ "less/index.less" ]
        }
      }
    },

    // connect //
    connect: {
      options: {
        hostname: "*",
        livereload: 35729,
        port: 9000
      },
      livereload: {
        options: {
          base: ["dist"],
          open: true
        }
      }
    },

    // watch //
    watch: {
      assemble: {
        files: ["{,*/}*.{md,hbs,yml,less,purs,js}"],
        tasks: ["build"]
      },
      livereload: {
        options: {
          livereload: "<%= connect.options.livereload %>"
        },
        files: [
          "dist/{,*/}*.html",
          "dist/assets/{,*/}*.css",
          "dist/assets/{,*/}*.js",
          "dist/assets/{,*/}*.{png,jpg,jpeg,gif,webp,svg}"
        ]
      }
    },

    // clean //
    clean: {
      lib: ["output"],
      tests: ["tmp"],
      assemble: ["dist"]
    },

    // s3 //
    aws: grunt.file.readJSON(".aws.json"),
    s3: {
      options: {
        key:    "<%= aws.key %>",
        secret: "<%= aws.secret %>",
        bucket: "<%= aws.bucket %>",
        access: "public-read",
        verify: true
      },
      site: { sync: [{ src: "dist/**", rel: "dist/" }] }
    }

  });

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
    "pscMake:lib",
    "dotPsci",
    "assemble",
    "less",
    "copy:bower",
    "copy:site"
  ]);

  grunt.registerTask("test", [
    "pscMake:tests",
    "copy:ps",
    "execute:tests"
  ]);

  grunt.registerTask("dev", [
    "build",
    "connect:livereload",
    "watch"
  ]);

  grunt.registerTask("deploy", [
    "clean",
    "build",
    "s3"
  ]);

  grunt.registerTask("default", [
    "clean",
    "build",
    "test"
  ]);
};

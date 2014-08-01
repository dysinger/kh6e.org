module.exports = {

  lib: {
    options: {
      module: [ "KH6E" ]
    },
    src: [
      "src/**/*.purs",
      "bower_components/purescript-*/src/**/*.purs"
    ],
    dest: "dist/assets/js/kh6e.js"
  },

  tests: {
    options: {
      main: true
    },
    src: [
      "tests/**/*.purs",
      "src/**/*.purs",
      "bower_components/purescript-*/src/**/*.purs"
    ],
    dest: "tmp/tests.js"
  }

};
